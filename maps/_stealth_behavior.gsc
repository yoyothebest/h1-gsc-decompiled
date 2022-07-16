// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    _id_908E( var_0 );
    thread _id_9090();
}

_id_3A55()
{
    var_0 = [];
    var_0["looking_away"]["stand"] = 500;
    var_0["looking_away"]["crouch"] = -400;
    var_0["looking_away"]["prone"] = 0;
    var_0["neutral"]["stand"] = 500;
    var_0["neutral"]["crouch"] = 200;
    var_0["neutral"]["prone"] = 50;
    var_0["looking_towards"]["stand"] = 800;
    var_0["looking_towards"]["crouch"] = 400;
    var_0["looking_towards"]["prone"] = 100;
    var_1 = [];
    var_1["looking_away"]["stand"] = 800;
    var_1["looking_away"]["crouch"] = 300;
    var_1["looking_away"]["prone"] = 100;
    var_1["neutral"]["stand"] = 900;
    var_1["neutral"]["crouch"] = 700;
    var_1["neutral"]["prone"] = 500;
    var_1["looking_towards"]["stand"] = 1100;
    var_1["looking_towards"]["crouch"] = 900;
    var_1["looking_towards"]["prone"] = 700;
    _id_3A7E( var_0, var_1 );
}

_id_3A7E( var_0, var_1 )
{
    if ( isdefined( var_0 ) )
    {
        self._id_0669._id_13A2._id_8AF8["hidden"]["looking_away"]["stand"] = var_0["looking_away"]["stand"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["looking_away"]["crouch"] = var_0["looking_away"]["crouch"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["looking_away"]["prone"] = var_0["looking_away"]["prone"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["neutral"]["stand"] = var_0["neutral"]["stand"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["neutral"]["crouch"] = var_0["neutral"]["crouch"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["neutral"]["prone"] = var_0["neutral"]["prone"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["looking_towards"]["stand"] = var_0["looking_towards"]["stand"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["looking_towards"]["crouch"] = var_0["looking_towards"]["crouch"];
        self._id_0669._id_13A2._id_8AF8["hidden"]["looking_towards"]["prone"] = var_0["looking_towards"]["prone"];
    }

    if ( isdefined( var_1 ) )
    {
        self._id_0669._id_13A2._id_8AF8["alert"]["looking_away"]["stand"] = var_1["looking_away"]["stand"];
        self._id_0669._id_13A2._id_8AF8["alert"]["looking_away"]["crouch"] = var_1["looking_away"]["crouch"];
        self._id_0669._id_13A2._id_8AF8["alert"]["looking_away"]["prone"] = var_1["looking_away"]["prone"];
        self._id_0669._id_13A2._id_8AF8["alert"]["neutral"]["stand"] = var_1["neutral"]["stand"];
        self._id_0669._id_13A2._id_8AF8["alert"]["neutral"]["crouch"] = var_1["neutral"]["crouch"];
        self._id_0669._id_13A2._id_8AF8["alert"]["neutral"]["prone"] = var_1["neutral"]["prone"];
        self._id_0669._id_13A2._id_8AF8["alert"]["looking_towards"]["stand"] = var_1["looking_towards"]["stand"];
        self._id_0669._id_13A2._id_8AF8["alert"]["looking_towards"]["crouch"] = var_1["looking_towards"]["crouch"];
        self._id_0669._id_13A2._id_8AF8["alert"]["looking_towards"]["prone"] = var_1["looking_towards"]["prone"];
    }
}

enemy_try_180_turn( var_0 )
{
    if ( self._id_0669._id_5836._id_012C )
        return;

    var_1 = anglestoforward( self.angles );
    var_2 = _func_114( var_0 - self._id_02E2 );

    if ( _func_0F6( var_1, var_2 ) < -0.8 )
    {
        var_3 = self._id_02E2 + ( 0, 0, 16 );
        var_4 = var_0 + ( 0, 0, 16 );
        var_5 = _func_08F( var_3, var_4 );

        if ( var_5 == var_4 )
            _id_A510::_id_0BC9( self, "patrol_turn180" );
    }
}

_id_324A( var_0 )
{
    self notify( "going_back" );
    self endon( "death" );
    self notify( "stop_loop" );
    enemy_try_180_turn( var_0 );

    if ( isdefined( self._id_7A9C ) )
    {
        if ( isdefined( self._id_5545 ) )
            self._id_04A4 = self._id_5545._id_04A6;

        thread _id_A55F::_id_66FC();
    }
    else
    {
        if ( !self._id_0669._id_5836._id_012C )
        {
            _id_A5A4::_id_7E45( "patrol_walk", 1 );
            self._id_2AF3 = 1;
            self._id_2B0E = 1;
        }

        if ( !self _meth_81C7( var_0 ) )
        {
            var_1 = enemy_get_closest_pathnodes( 128, var_0 );

            if ( !var_1.size )
                return;

            var_1 = common_scripts\utility::_id_3CCB( var_0, var_1 );
            var_0 = var_1[0]._id_02E2;
        }

        self _meth_81AA( var_0 );
        self._id_01C4 = 40;
    }
}

_id_08D2( var_0, var_1, var_2, var_3 )
{
    self._id_0669._id_13A2._id_08E6[var_0][var_1] = var_2;
}

ai_change_ai_functions( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        return;

    var_2 = _func_1D3( var_1 );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        ai_change_behavior_function( var_0, var_4, var_1[var_4] );
    }
}

ai_change_behavior_function( var_0, var_1, var_2, var_3 )
{
    _id_08D2( var_0, var_1, var_2, var_3 );
}

_id_08C6()
{
    self._id_0669._id_13A2._id_33C0._id_2532 = undefined;
}

_id_08C7()
{
    if ( !isdefined( self._id_0669._id_13A2._id_33C0._id_2532 ) )
        return;

    self._id_0669._id_13A2._id_33C0._id_2532._id_02BB notify( "stop_loop" );
    self _meth_8143();
    _id_08C6();
}

_id_0910( var_0, var_1, var_2, var_3 )
{
    self._id_0669._id_13A2._id_33C0._id_2532 = spawnstruct();
    self._id_0669._id_13A2._id_33C0._id_2532._id_02BB = var_0;
    self._id_0669._id_13A2._id_33C0._id_2532._id_0C6C = var_1;
    self._id_0669._id_13A2._id_33C0._id_2532._id_0428 = var_2;
    self._id_0669._id_13A2._id_33C0._id_2532._id_315B = var_3;
    thread _id_08B9( var_0, var_1, var_2, var_3 );
}

_id_08B9( var_0, var_1, var_2, var_3 )
{
    wait 0.1;

    if ( !isdefined( self._id_0BEE ) )
        return;

    var_4 = self._id_0BEE;
    self waittill( "death" );

    if ( isdefined( self._id_0BEF ) )
        return;

    var_0 thread _id_A510::_id_0C18( var_4, var_1 );
}

_id_908E( var_0 )
{
    level._id_0669._id_13A2 = spawnstruct();
    level._id_0669._id_13A2._id_8899 = [];
    level._id_0669._id_13A2._id_8899["huh"] = 0;
    level._id_0669._id_13A2._id_8899["hmph"] = 0;
    level._id_0669._id_13A2._id_8899["wtf"] = 0;
    level._id_0669._id_13A2._id_8899["spotted"] = 0;
    level._id_0669._id_13A2._id_8899["corpse"] = 0;
    level._id_0669._id_13A2._id_8899["alert"] = 0;
    level._id_0669._id_13A2._id_222C = spawnstruct();
    level._id_0669._id_13A2._id_222C._id_554A = ( 0, 0, -100000 );
    level._id_0669._id_13A2._id_222C.search_radius = 512;
    level._id_0669._id_13A2._id_222C.node_array = undefined;
    level._id_0669._id_13A2.event_explosion_index = 5;
    level._id_0669._id_13A2.system_state_functions = [];
    system_init_state_functions( var_0 );
    _id_A585::main();
    common_scripts\utility::_id_383D( "_stealth_searching_for_nodes" );
    common_scripts\utility::_id_383D( "_stealth_getallnodes" );
    common_scripts\utility::_id_383D( "_stealth_event" );
}

system_init_state_functions( var_0 )
{
    var_1 = 0;

    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0["hidden"] ) && isdefined( var_0["alert"] ) && isdefined( var_0["spotted"] ) )
            var_1 = 1;
        else
        {

        }
    }

    if ( !var_1 )
    {
        system_set_state_function( "hidden", ::system_state_hidden );
        system_set_state_function( "alert", ::system_state_alert );
        system_set_state_function( "spotted", ::_id_9095 );
    }
    else
    {
        system_set_state_function( "hidden", var_0["hidden"] );
        system_set_state_function( "alert", var_0["alert"] );
        system_set_state_function( "spotted", var_0["spotted"] );
    }
}

_id_9090()
{
    var_0 = level._id_0669._id_13A2.system_state_functions;
    thread system_message_handler( "_stealth_hidden", var_0["hidden"] );
    thread system_message_handler( "_stealth_alert", var_0["alert"] );
    thread system_message_handler( "_stealth_spotted", var_0["spotted"] );
}

system_message_handler( var_0, var_1 )
{
    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        thread [[ var_1 ]]();
        common_scripts\utility::_id_3857( var_0 );
    }
}

_id_9095()
{
    _id_A5A4::_id_1333( "axis" );
}

system_state_alert()
{
    level._id_0669._id_13A2._id_8899["spotted"] = 0;
    _id_A5A4::_id_1332( "axis" );
    setdvar( "bcs_stealth", "" );
}

system_state_hidden()
{
    level._id_0669._id_13A2._id_8899["spotted"] = 0;
    _id_A5A4::_id_1332( "axis" );
    setdvar( "bcs_stealth", "1" );
    animscripts\battlechatter::_id_7451( "allies", "threat" );
}

system_set_state_function( var_0, var_1 )
{
    if ( !( var_0 == "hidden" || var_0 == "alert" || var_0 == "spotted" ) )
    {

    }

    level._id_0669._id_13A2.system_state_functions[var_0] = var_1;
}

enemy_logic( var_0, var_1, var_2, var_3 )
{
    _id_324F( var_0, var_1, var_2, var_3 );
    thread enemy_message_loop();
    thread _id_3290();
    thread enemy_awareness_loop();
    thread _id_31EC();
    thread _id_3211();
}

_id_324F( var_0, var_1, var_2, var_3 )
{
    self._id_0669._id_13A2 = spawnstruct();
    self._id_0669._id_13A2.sndnum = _func_0B4( 1, 4 );
    self._id_0669._id_13A2._id_08E6 = [];
    self._id_0669._id_13A2._id_08E6["state"] = [];
    self._id_0669._id_13A2._id_08E6["alert"] = [];
    self._id_0669._id_13A2._id_08E6["corpse"] = [];
    self._id_0669._id_13A2._id_08E6["awareness"] = [];
    enemy_default_ai_functions( "state" );
    enemy_default_ai_functions( "alert" );
    enemy_default_ai_functions( "corpse" );
    enemy_default_ai_functions( "awareness" );
    enemy_default_ai_functions( "animation" );
    ai_change_ai_functions( "state", var_0 );
    ai_change_ai_functions( "alert", var_1 );
    ai_change_ai_functions( "corpse", var_2 );
    ai_change_ai_functions( "awareness", var_3 );
    _id_A5A4::_id_32DD( "_stealth_enemy_alert_level_action" );
    _id_A5A4::_id_32DD( "_stealth_running_to_corpse" );
    _id_A5A4::_id_32DD( "_stealth_behavior_reaction_anim" );
    _id_A5A4::_id_32DD( "_stealth_behavior_first_reaction" );
    _id_A5A4::_id_32DD( "_stealth_behavior_reaction_anim_in_progress" );
    self._id_0669._id_13A2._id_33C0 = spawnstruct();

    if ( self._id_0669._id_5836._id_012C )
        _id_3223();
}

enemy_default_ai_functions( var_0 )
{
    switch ( var_0 )
    {
        case "state":
            _id_08D2( "state", "hidden", ::_id_327C );
            _id_08D2( "state", "alert", ::enemy_state_alert );
            _id_08D2( "state", "spotted", ::_id_327D );
            break;
        case "alert":
            _id_08D2( "alert", "reset", ::enemy_alert_level_lostem );
            _id_08D2( "alert", "alerted_once", ::enemy_alert_level_alerted_once );
            _id_08D2( "alert", "alerted_again", ::enemy_alert_level_alerted_again );
            _id_08D2( "alert", "attack", ::_id_31D6 );
            break;
        case "corpse":
            _id_08D2( "corpse", "saw", ::_id_3214 );
            _id_08D2( "corpse", "found", ::_id_320D );
            break;
        case "awareness":
            _id_08D2( "awareness", "heard_scream", ::enemy_awareness_reaction_heard_scream );
            _id_08D2( "awareness", "doFlashBanged", ::enemy_awareness_reaction_flashbang );
            _id_08D2( "awareness", "explode", ::enemy_awareness_reaction_explosion );
            break;
        case "animation":
            _id_08D2( "animation", "wrapper", ::_id_31F2 );

            if ( self._id_0669._id_5836._id_012C )
            {
                _id_08D2( "animation", "reset", ::_id_31ED );
                _id_08D2( "animation", "attack", ::_id_2C85 );
                _id_08D2( "animation", "heard_scream", ::_id_2C85 );
                _id_08D2( "animation", "bulletwhizby", ::_id_2C88 );
                _id_08D2( "animation", "projectile_impact", ::_id_2C89 );
                _id_08D2( "animation", "explode", ::_id_2C88 );
            }
            else
            {
                _id_08D2( "animation", "reset", ::_id_31ED );
                _id_08D2( "animation", "alerted_once", ::_id_31ED );
                _id_08D2( "animation", "alerted_again", ::_id_31ED );
                _id_08D2( "animation", "attack", ::_id_31E7 );
                _id_08D2( "animation", "heard_scream", ::_id_31EB );
                _id_08D2( "animation", "heard_corpse", ::_id_31EB );
                _id_08D2( "animation", "saw_corpse", ::_id_31F1 );
                _id_08D2( "animation", "found_corpse", ::_id_31EA );
                _id_08D2( "animation", "bulletwhizby", ::enemy_animation_whizby );
                _id_08D2( "animation", "projectile_impact", ::enemy_animation_whizby );
                _id_08D2( "animation", "explode", ::_id_31EB );
            }

            _id_08D2( "animation", "doFlashBanged", ::_id_31ED );
            break;
    }
}

_id_3223()
{
    if ( threatbiasgroupexists( "dog" ) )
        self _meth_817B( "dog" );

    if ( isdefined( self._id_0142 ) || isdefined( self._id_0179 ) )
        return;

    self._id_01FF = 1;
    self._id_01FB = 1;
    self.allowdeath = 1;
    thread _id_A510::_id_0BCE( self, "_stealth_dog_sleeping", undefined, "stop_loop" );
}

enemy_message_loop()
{
    thread ai_message_handler( "_stealth_hidden", "hidden" );
    thread ai_message_handler( "_stealth_alert", "alert" );
    thread ai_message_handler( "_stealth_spotted", "spotted" );
}

ai_message_handler( var_0, var_1 )
{
    self endon( "death" );
    self endon( "pain_death" );

    for (;;)
    {
        common_scripts\utility::_id_384A( var_0 );
        var_2 = self._id_0669._id_13A2._id_08E6["state"][var_1];
        self thread [[ var_2 ]]();
        common_scripts\utility::_id_3857( var_0 );
    }
}

_id_327C()
{
    level endon( "_stealth_detection_level_change" );
    self._id_019B = 0.5;
    self._id_0179 = undefined;

    if ( self._id_0669._id_5836._id_012C )
        return;

    self._id_011F = 1;

    if ( !isdefined( self._id_6398 ) )
        self._id_6398 = self._id_1300;

    if ( !isdefined( self._id_6392 ) )
        self._id_6392 = self.accuracy;

    self._id_1300 = self._id_6398;
    self.accuracy = self._id_6392;
    self._id_017D = 1;
    self _meth_816A();
}

enemy_state_alert()
{
    level endon( "_stealth_detection_level_change" );
}

_id_3265()
{
    self._id_019B = 0.01;
    self._id_01FB = 0;
    self._id_011F = 0;
    _id_A5A4::_id_1ED1();
    self._id_017D = 0;
}

_id_327D()
{
    var_0 = "_stealth_spotted";
    var_1 = "_stealth_detection_level_change" + var_0;
    thread state_change_ender( var_0, var_1 );
    level endon( var_1 );
    self endon( "death" );
    self._id_019B = 0.01;
    self._id_01FB = 0;

    if ( !self._id_0669._id_5836._id_012C )
    {
        self._id_011F = 0;
        _id_A5A4::_id_1ED1();
        self._id_1300 *= 3;
        self.accuracy *= 3;
        self._id_017D = 0;
        _id_327E();
    }

    if ( !_func_1A1( self._id_0142 ) )
        common_scripts\utility::_id_A0A0( "enemy", _func_0B5( 1, 3 ) );

    if ( self._id_0669._id_5836._id_012C )
        self._id_0179 = level._id_0318;
    else if ( _func_0B2( 100 ) > 25 )
        self._id_0179 = level._id_0318;

    thread enemy_spotted_clear_favorite();
}

enemy_spotted_clear_favorite()
{
    self endon( "death" );
    wait 1.5;
    self._id_0179 = undefined;
}

state_change_ender( var_0, var_1 )
{
    common_scripts\utility::_id_3857( var_0 );
    level notify( var_1 );
}

_id_31EC()
{
    self endon( "death" );
    self endon( "pain_death" );

    for (;;)
    {
        self waittill( "event_awareness", var_0 );
        var_1 = self._id_0669._id_13A2._id_08E6["animation"]["wrapper"];
        self thread [[ var_1 ]]( var_0 );
    }
}

_id_31F2( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );

    if ( _id_31EF( var_0 ) )
        return;

    _id_31E9( var_0 );
    _id_31EE( var_0 );
}

_id_31E9( var_0 )
{
    if ( isdefined( self._id_0669._id_13A2._id_33C0._id_2532 ) )
    {
        _id_31E8( var_0 );
        return;
    }

    var_1 = self._id_0669._id_13A2._id_08E6["animation"][var_0];
    self [[ var_1 ]]( var_0 );
}

_id_31E8( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    var_1 = self._id_0669._id_13A2._id_33C0._id_2532._id_02BB;
    var_2 = self._id_0669._id_13A2._id_33C0._id_2532._id_0C6C;
    var_3 = self._id_0669._id_13A2._id_33C0._id_2532._id_0428;
    var_4 = self._id_0669._id_13A2._id_33C0._id_2532._id_315B;
    _id_A5A4::_id_32DE( "_stealth_behavior_reaction_anim" );
    self.allowdeath = 1;
    var_1 notify( var_4 );

    if ( isdefined( self._id_0BEE ) )
    {
        self._id_0BEF = 1;
        var_1 thread _id_A510::_id_0C18( self._id_0BEE, var_2 );
    }

    if ( var_0 != "doFlashBanged" )
    {
        if ( isdefined( var_3 ) || isdefined( self._id_46E9 ) )
            var_1 _id_A510::_id_0BC9( self, var_2, var_3 );
        else
            var_1 _id_A510::_id_0BCA( self, "gravity", var_2 );
    }

    _id_08C6();
}

_id_31EF( var_0 )
{
    self notify( "enemy_awareness_reaction", var_0 );

    if ( _id_A5A4::_id_32D8( "_stealth_behavior_first_reaction" ) || _id_A5A4::_id_32D8( "_stealth_behavior_reaction_anim_in_progress" ) )
        return 1;

    _id_327E();

    switch ( var_0 )
    {
        case "explode":
        case "heard_corpse":
        case "saw_corpse":
        case "found_corpse":
            _id_A5A4::_id_32DE( "_stealth_behavior_reaction_anim" );
            break;
        case "reset":
        case "alerted_once":
        case "alerted_again":
            break;
        default:
            _id_A5A4::_id_32DE( "_stealth_behavior_first_reaction" );
            _id_A5A4::_id_32DE( "_stealth_behavior_reaction_anim" );
            break;
    }

    _id_A5A4::_id_32DE( "_stealth_behavior_reaction_anim_in_progress" );
    return 0;
}

_id_31EE( var_0 )
{
    switch ( var_0 )
    {
        default:
            _id_A5A4::_id_32DA( "_stealth_behavior_reaction_anim" );
            break;
    }

    _id_A5A4::_id_32DA( "_stealth_behavior_reaction_anim_in_progress" );
}

enemy_animation_whizby( var_0 )
{
    self.allowdeath = 1;
    var_1 = "_stealth_behavior_whizby_" + _func_0B2( 5 );
    thread _id_A510::_id_0BCA( self, "gravity", var_1 );
    wait 1.5;
    self notify( "stop_animmode" );
}

_id_31E7( var_0 )
{
    var_1 = self._id_0669._id_5836._id_33C0.awareness[var_0];

    if ( _func_0EE( var_1._id_02E2, self._id_02E2 ) < 256 )
        var_2 = "_stealth_behavior_spotted_short";
    else
        var_2 = "_stealth_behavior_spotted_long";

    self.allowdeath = 1;
    thread _id_A510::_id_0BCA( self, "gravity", var_2 );
    common_scripts\utility::_id_A0A0( var_2, _func_0B5( 1.5, 3 ) );
    self notify( "stop_animmode" );
}

_id_31ED( var_0 )
{

}

_id_31EB( var_0 )
{
    self.allowdeath = 1;
    var_1 = level._id_0318;

    if ( isdefined( self._id_0142 ) )
        var_1 = self._id_0142;
    else if ( isdefined( self._id_0179 ) )
        var_1 = self._id_0179;

    var_2 = _func_0EE( self._id_02E2, var_1._id_02E2 );
    var_3 = 4;
    var_4 = 1024;

    for ( var_5 = 1; var_5 < var_3; var_5++ )
    {
        var_6 = var_4 * var_5 / var_3;

        if ( var_2 < var_6 )
            break;
    }

    var_7 = "_stealth_behavior_generic" + var_5;
    _id_A510::_id_0BCA( self, "gravity", var_7 );
}

_id_31F1( var_0 )
{
    self.allowdeath = 1;
    var_1 = "_stealth_behavior_saw_corpse";
    _id_A510::_id_0BCA( self, "gravity", var_1 );
}

_id_31EA( var_0 )
{
    self.allowdeath = 1;
    var_1 = "_stealth_find_jog";
    _id_A510::_id_0BCA( self, "gravity", var_1 );
}

_id_2C85( var_0 )
{
    self.allowdeath = 1;
    var_1 = undefined;

    if ( _func_0B2( 100 ) < 50 )
        var_1 = "_stealth_dog_wakeup_fast";
    else
        var_1 = "_stealth_dog_wakeup_slow";

    _id_A510::_id_0BCA( self, "gravity", var_1 );
}

_id_2C88( var_0 )
{
    self.allowdeath = 1;
    var_1 = "_stealth_dog_wakeup_fast";
    _id_A510::_id_0BCA( self, "gravity", var_1 );
}

_id_2C89( var_0 )
{
    self.allowdeath = 1;
    var_1 = "_stealth_dog_wakeup_slow";
    _id_A510::_id_0BCA( self, "gravity", var_1 );
}

enemy_awareness_loop()
{
    self endon( "death" );
    self endon( "pain_death" );

    for (;;)
    {
        self waittill( "event_awareness", var_0 );

        if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
            continue;

        var_1 = self._id_0669._id_13A2._id_08E6["awareness"];

        if ( isdefined( var_1[var_0] ) )
            self thread [[ var_1[var_0] ]]( var_0 );
    }
}

enemy_awareness_reaction_heard_scream( var_0 )
{
    if ( self._id_0669._id_5836._id_012C )
        return;

    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "another_enemy_awareness_reaction" );
    var_1 = "scream_kill_safety_check";
    thread enemy_awareness_reaction_safety( var_0, var_1 );
    _id_3265();
    var_2 = _id_3243();
    _id_327E();
    self endon( "death" );
    var_3 = self._id_0669._id_5836._id_33C0.awareness[var_0];
    var_3 = enemy_find_nodes_at_origin( var_3 );
    enemy_investigate_explosion( var_3 );
    thread _id_31F6();
    self notify( var_1 );
    _id_324A( var_2 );
}

enemy_awareness_reaction_flashbang( var_0 )
{
    if ( self._id_0669._id_5836._id_012C )
        return;

    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "another_enemy_awareness_reaction" );
    var_1 = "flashbang_kill_safety_check";
    thread enemy_awareness_reaction_safety( var_0, var_1 );
    _id_3265();
    var_2 = _id_3243();
    _id_327E();
    self endon( "death" );
    var_3 = self._id_0669._id_5836._id_33C0.awareness[var_0];
    self waittill( "stop_flashbang_effect" );
    var_3 = enemy_find_nodes_at_origin( var_3 );
    thread enemy_investigate_explosion( var_3 );

    if ( var_3 != ( 0, 0, 0 ) )
    {
        wait 1.05;
        self waittill( "goal" );
        thread _id_31FD();
        thread enemy_announce_spotted_bring_team( var_3 );
    }

    thread _id_31F6();
    self notify( var_1 );
    _id_324A( var_2 );
}

enemy_awareness_reaction_explosion( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );

    if ( !self._id_0669._id_5836._id_012C )
    {
        self endon( "_stealth_saw_corpse" );
        level endon( "_stealth_found_corpse" );
    }

    level endon( "_stealth_spotted" );
    self endon( "another_enemy_awareness_reaction" );
    var_1 = "explostion_kill_safety_check";
    thread enemy_awareness_reaction_safety( var_0, var_1 );
    _id_3265();
    var_2 = _id_3243();
    _id_327E();
    self endon( "death" );
    var_3 = self._id_0669._id_5836._id_33C0.awareness[var_0];
    var_3 = enemy_find_nodes_at_origin( var_3 );
    thread _id_31FD();
    enemy_investigate_explosion( var_3 );
    thread _id_31F6();
    self notify( var_1 );
    _id_324A( var_2 );
}

enemy_awareness_reaction_safety( var_0, var_1 )
{
    self endon( "death" );
    self endon( var_1 );

    for (;;)
    {
        self waittill( "enemy_awareness_reaction", var_2 );

        if ( var_0 == var_2 )
        {
            continue;
            continue;
        }

        break;
    }

    self notify( "another_enemy_awareness_reaction" );
}

enemy_find_nodes_at_origin( var_0 )
{
    var_1 = enemy_get_closest_pathnodes( 512, var_0 );
    var_2 = var_0;

    if ( isdefined( var_1 ) && var_1.size )
    {
        for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        {
            if ( isdefined( var_1[var_3]._stealth_corpse_behavior_taken ) )
                continue;

            var_0 = var_1[var_3]._id_02E2;
            var_1[var_3] thread enemy_corpse_reaction_takenode();
            var_4 = common_scripts\utility::_id_3CCB( var_1[var_3]._id_02E2, var_1, undefined, undefined, 40 );
            common_scripts\utility::_id_0D13( var_4, ::enemy_corpse_reaction_takenode );
            break;
        }
    }
    else
        var_0 = ( 0, 0, 0 );

    if ( var_2 == var_0 )
        var_0 = ( 0, 0, 0 );

    return var_0;
}

enemy_investigate_explosion( var_0 )
{
    if ( var_0 != ( 0, 0, 0 ) )
    {
        wait(_func_0B3( 1 ));
        thread _id_326F( var_0 );
        self._id_2AF3 = 0;
        self._id_2B0E = 0;
        self waittill( "goal" );
        wait(_func_0B5( 30, 50 ));
    }
    else
        wait(_func_0B5( 1, 4 ));
}

_id_3290()
{
    self endon( "death" );
    self endon( "pain_death" );

    if ( self._id_0669._id_5836._id_012C )
        thread _id_328D();

    for (;;)
    {
        self waittill( "_stealth_enemy_alert_level_change" );
        var_0 = self._id_0669._id_5836._id_09C4.lvl;
        var_1 = self._id_0669._id_5836._id_09C4._id_0142;
        thread _id_31D8( var_0, var_1 );
    }
}

_id_328D()
{
    self endon( "death" );
    self endon( "pain_death" );
    self waittill( "pain" );
    self._id_01FB = 0;
}

_id_31D8( var_0, var_1 )
{
    _id_A5A4::_id_32DE( "_stealth_enemy_alert_level_action" );
    var_2 = self._id_0669._id_13A2._id_08E6["alert"];
    self thread [[ var_2[var_0] ]]( var_1 );
}

_id_31DD()
{
    self endon( "_stealth_enemy_alert_level_change" );
    self endon( "death" );
    self endon( "pain_death" );
    var_0 = _id_3243();
    _id_327E();
    self waittill( "normal" );
    _id_A5A4::_id_32DA( "_stealth_enemy_alert_level_action" );
    _id_A5A4::_id_32E4( "_stealth_saw_corpse" );
    wait 0.05;
    common_scripts\utility::_id_3857( "_stealth_found_corpse" );
    thread _id_31F6();
    _id_324A( var_0 );
}

_id_3243()
{
    if ( isdefined( self._id_5558 ) )
        return self._id_5558._id_02E2;

    if ( isdefined( self._id_5559 ) )
        return self._id_5559;

    return self._id_02E2;
}

enemy_alert_level_lostem( var_0 )
{
    self notify( "normal" );
}

enemy_alert_level_alerted_once( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "death" );
    self endon( "pain_death" );
    thread _id_31F7();
    thread _id_31DD();

    if ( isdefined( self._id_7A9C ) )
    {
        var_1 = !( isdefined( self.canpatrolturn ) && self.canpatrolturn );
        _id_A5A4::_id_7E45( "patrol_walk", 1, var_1 );
        self._id_2AF3 = 1;
        self._id_2B0E = 1;
    }

    var_2 = _func_114( var_0._id_02E2 - self._id_02E2 );
    var_3 = _func_0EE( var_0._id_02E2, self._id_02E2 );
    var_3 *= 0.25;

    if ( var_3 < 64 )
        var_3 = 64;

    if ( var_3 > 128 )
        var_3 = 128;

    var_2 = _id_A5A4::vector_multiply( var_2, var_3 );
    var_4 = self._id_02E2 + var_2 + ( 0, 0, 16 );
    var_5 = var_4 + ( 0, 0, -96 );
    var_4 = _func_08F( var_4, var_5 );

    if ( var_4 == var_5 )
        return;

    self _meth_81AA( var_4 );
    self._id_01C4 = 4;
    common_scripts\utility::_id_A0A0( "goal", 2 );
    wait 3;
    self notify( "normal" );
}

enemy_alert_level_alerted_again( var_0 )
{
    self endon( "_stealth_enemy_alert_level_change" );
    level endon( "_stealth_spotted" );
    self endon( "death" );
    self endon( "pain_death" );
    thread _id_31F7();
    thread _id_31DD();
    _id_A5A4::_id_7E45( "_stealth_patrol_jog" );
    self._id_2AF3 = 0;
    self._id_2B0E = 0;
    var_1 = var_0._id_02E2;
    var_2 = _func_0EE( var_1, self._id_02E2 );
    self _meth_81AA( var_1 );
    self._id_01C4 = var_2 * 0.5;
    self waittill( "goal" );
    _id_A5A4::_id_7E45( "_stealth_patrol_walk", 1 );
    self _meth_81AA( var_1 );
    self._id_01C4 = 64;
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self waittill( "goal" );
    wait 12;
    _id_A5A4::_id_7E45( "_stealth_patrol_walk", 1 );
    self notify( "normal" );
}

_id_31D6( var_0 )
{
    self endon( "death" );
    self endon( "pain_death" );
    self endon( "_stealth_stop_stealth_behavior" );
    thread _id_31FA( self._id_02E2 );
    thread _id_3208();
}

_id_3208()
{
    var_0 = 2048;
    self._id_01C4 = var_0;

    if ( isdefined( self._id_7AE2 ) )
        return;

    self endon( "death" );
    self endon( "_stealth_stop_stealth_behavior" );

    while ( isdefined( self._id_0142 ) )
    {
        self _meth_81AA( self._id_0142._id_02E2 );
        self._id_01C4 = var_0;

        if ( var_0 > 600 )
            var_0 *= 0.75;

        wait 15;
    }
}

isininteriorvozone()
{
    if ( isdefined( level._interior_vo_zone ) )
    {
        for ( var_0 = 0; var_0 < level._interior_vo_zone.size; var_0++ )
        {
            if ( self _meth_80AB( level._interior_vo_zone[var_0] ) )
                return 1;
        }

        return 0;
    }
    else
        return 0;
}

_id_31FD()
{
    if ( !_id_31F8( "wtf" ) )
        return;

    self _meth_809C( "RU_0_reaction_casualty_generic" );
}

_id_31F7()
{
    if ( !_id_31F8( "huh" ) )
        return;

    if ( isininteriorvozone() )
        var_0 = "scoutsniper_ru" + self._id_0669._id_13A2.sndnum + "_huh_house_int";
    else
        var_0 = "scoutsniper_ru" + self._id_0669._id_13A2.sndnum + "_huh";

    self _meth_809C( var_0 );
}

_id_31F6()
{
    if ( !_id_31F8( "hmph" ) )
        return;

    if ( isininteriorvozone() )
        var_0 = "scoutsniper_ru" + self._id_0669._id_13A2.sndnum + "_hmph_house_int";
    else
        var_0 = "scoutsniper_ru" + self._id_0669._id_13A2.sndnum + "_hmph";

    self _meth_809C( var_0 );
}

_id_31FA( var_0 )
{
    self endon( "death" );
    common_scripts\utility::_id_384A( "_stealth_spotted" );

    if ( !_id_31F8( "spotted" ) )
        return;

    thread enemy_announce_spotted_bring_team( var_0 );

    if ( self._id_0669._id_5836._id_012C )
        return;

    self _meth_809C( "RU_0_reaction_casualty_generic" );
}

enemy_announce_spotted_bring_team( var_0 )
{
    var_1 = _func_0DA( "axis", "all" );

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] == self )
            continue;

        if ( isdefined( var_1[var_2]._id_0142 ) )
            continue;

        if ( isdefined( var_1[var_2]._id_0179 ) )
            continue;

        var_1[var_2] notify( "heard_scream", var_0 );
    }
}

_id_31F5()
{
    if ( isdefined( self._id_39F2 ) )
    {
        self endon( "death" );
        wait(self._id_39F2);
    }

    if ( !_id_31F8( "corpse" ) )
        return;

    self _meth_809C( "RU_0_reaction_casualty_generic" );
}

_id_31F8( var_0 )
{
    if ( level._id_0669._id_13A2._id_8899[var_0] )
        return 0;

    level._id_0669._id_13A2._id_8899[var_0] = 1;
    thread _id_31F9( var_0 );
    return 1;
}

_id_31F9( var_0 )
{
    if ( var_0 == "spotted" )
        return;

    wait 3;
    level._id_0669._id_13A2._id_8899[var_0] = 0;
}

_id_3211()
{
    if ( self._id_0669._id_5836._id_012C )
        return;

    self endon( "death" );
    self endon( "pain_death" );
    thread _id_3247();

    for (;;)
    {
        self waittill( "_stealth_saw_corpse" );
        _id_3270();
    }
}

_id_3270()
{
    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    level endon( "_stealth_found_corpse" );
    thread _id_31F7();

    for (;;)
    {
        _id_A5A4::_id_32E4( "_stealth_enemy_alert_level_action" );
        _id_3215();
        self waittill( "normal" );
    }
}

_id_327E()
{
    if ( !_id_A5A4::_id_32D8( "_stealth_behavior_reaction_anim" ) )
    {
        self _meth_8143();
        self notify( "stop_animmode" );
        self notify( "stop_loop" );
    }

    if ( isdefined( self._id_7A9C ) )
    {
        if ( isdefined( self._id_5545 ) )
            self._id_5545._id_6707 = undefined;

        self notify( "release_node" );
        self notify( "end_patrol" );
    }

    self notify( "stop_first_frame" );
    _id_A5A4::_id_1ED1();
}

_id_3215()
{
    self endon( "enemy_alert_level_change" );
    var_0 = self._id_0669._id_13A2._id_08E6["corpse"];
    self [[ var_0["saw"] ]]();
}

_id_3214()
{
    _id_327E();
    _id_A5A4::_id_32DE( "_stealth_running_to_corpse" );
    self._id_2AF3 = 0;
    self._id_2B0E = 0;
    _id_A5A4::_id_7E45( "_stealth_combat_jog" );
    self._id_01C4 = 80;
    self _meth_81AA( self._id_0669._id_5836._id_222C._id_2231._id_02E2 );
}

_id_3247()
{
    self endon( "death" );
    self endon( "pain_death" );

    if ( isdefined( self.no_corpse_caring ) )
        return;

    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    level endon( "_stealth_spotted" );
    var_0 = self._id_0669._id_13A2._id_08E6["corpse"];

    for (;;)
    {
        common_scripts\utility::_id_384A( "_stealth_found_corpse" );

        while ( common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
        {
            if ( _id_A5A4::_id_32D8( "_stealth_found_corpse" ) )
                thread _id_31F5();
            else
                self notify( "heard_corpse", ( 0, 0, 0 ) );

            _id_3265();
            self [[ var_0["found"] ]]();
            level waittill( "_stealth_found_corpse" );
        }
    }
}

_id_320D()
{
    _id_327E();

    if ( level._id_0669._id_5836._id_222C._id_554A != level._id_0669._id_13A2._id_222C._id_554A )
    {
        var_0 = level._id_0669._id_13A2._id_222C.search_radius;
        var_1 = level._id_0669._id_5836._id_222C._id_554A;
        level._id_0669._id_13A2._id_222C.node_array = enemy_get_closest_pathnodes( var_0, var_1 );
        level._id_0669._id_13A2._id_222C._id_554A = level._id_0669._id_5836._id_222C._id_554A;
    }

    var_2 = level._id_0669._id_13A2._id_222C.node_array;

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        if ( isdefined( var_2[var_3]._stealth_corpse_behavior_taken ) )
            continue;

        thread _id_326F( var_2[var_3]._id_02E2 );
        var_2[var_3] thread enemy_corpse_reaction_takenode();
        var_4 = common_scripts\utility::_id_3CCB( var_2[var_3]._id_02E2, var_2, undefined, undefined, 40 );
        common_scripts\utility::_id_0D13( var_4, ::enemy_corpse_reaction_takenode );
        break;
    }
}

_id_326F( var_0 )
{
    self notify( "enemy_runto_and_lookaround" );
    self endon( "enemy_runto_and_lookaround" );
    self endon( "death" );
    self endon( "_stealth_enemy_alert_level_change" );

    if ( !self._id_0669._id_5836._id_012C )
        self endon( "_stealth_saw_corpse" );

    level endon( "_stealth_spotted" );
    self _meth_81AA( var_0 );
    self._id_01C4 = 4;
    self waittill( "goal" );
    wait 0.5;

    if ( !self._id_0669._id_5836._id_012C )
        _id_A510::_id_0BCE( self, "_stealth_look_around", undefined, "stop_loop" );
}

enemy_corpse_reaction_takenode()
{
    self._stealth_corpse_behavior_taken = 1;
    wait 0.25;
    self._stealth_corpse_behavior_taken = undefined;
}

enemy_get_closest_pathnodes( var_0, var_1 )
{
    if ( !common_scripts\utility::_id_382E( "_stealth_getallnodes" ) )
    {
        if ( !common_scripts\utility::_id_382E( "_stealth_searching_for_nodes" ) )
        {
            common_scripts\utility::_id_383F( "_stealth_searching_for_nodes" );
            waitframe;
            var_2 = _func_0C5();
            var_3 = [];
            var_4 = var_0 * var_0;

            for ( var_5 = 0; var_5 < var_2.size; var_5++ )
            {
                if ( var_2[var_5]._id_04D9 != "Path" )
                    continue;

                if ( _func_0F0( var_2[var_5]._id_02E2, var_1 ) > var_4 )
                    continue;

                var_3[var_3.size] = var_2[var_5];
            }

            level._id_0669._id_13A2.search_nodes_array = var_3;
            waitframe;
            common_scripts\utility::_id_3831( "_stealth_searching_for_nodes" );
        }
        else
            common_scripts\utility::_id_3857( "_stealth_searching_for_nodes" );

        level _id_A5A4::_id_27EF( 0.2, common_scripts\utility::_id_3831, "_stealth_getallnodes" );
        level common_scripts\utility::_id_383F( "_stealth_getallnodes" );
    }

    return level._id_0669._id_13A2.search_nodes_array;
}

friendly_logic( var_0 )
{
    _id_3A66( var_0 );
    thread friendly_message_loop();
    thread _id_3A81();
}

_id_3A66( var_0 )
{
    self._id_0669._id_13A2 = spawnstruct();
    self._id_0669._id_13A2.accuracy = [];
    self._id_0669._id_13A2._id_4277 = 50;
    self._id_0669._id_13A2.badaccuracy = 0;
    self._id_0669._id_13A2._id_6398 = self._id_1300;
    self._id_0669._id_13A2._id_6392 = self.accuracy;
    self._id_0669._id_13A2._id_08E6 = [];
    self._id_0669._id_13A2._id_08E6["state"] = [];
    friendly_default_ai_functions( "state" );
    ai_change_ai_functions( "state", var_0 );
    _id_A5A4::_id_32DD( "_stealth_custom_anim" );
}

friendly_default_ai_functions( var_0 )
{
    switch ( var_0 )
    {
        case "state":
            _id_08D2( var_0, "hidden", ::_id_3A8A );
            _id_08D2( var_0, "alert", ::friendly_state_alert );
            _id_08D2( var_0, "spotted", ::_id_3A8B );
            break;
    }
}

friendly_message_loop()
{
    var_0 = self._id_0669._id_13A2._id_08E6["state"];
    thread ai_message_handler( "_stealth_hidden", "hidden" );
    thread ai_message_handler( "_stealth_alert", "alert" );
    thread ai_message_handler( "_stealth_spotted", "spotted" );
}

_id_3A8A()
{
    level endon( "_stealth_detection_level_change" );
    self._id_1300 = self._id_0669._id_13A2._id_4277;
    self.accuracy = self._id_0669._id_13A2._id_4277;
    self._id_0669._id_13A2._id_63CE = self._id_01D0;
    self._id_01D0 = 0;
    self._id_39C7 = 0;
    self._id_01FB = 1;
    self._id_01FF = 1;
    self._id_2AF3 = 0;
    self._id_2B0E = 0;
    _id_A5A4::_id_2A74();
    waitframe;
    self._id_017D = 0;
}

friendly_state_alert()
{
    level endon( "_stealth_detection_level_change" );
    self._id_1300 = self._id_0669._id_13A2._id_4277;
    self.accuracy = self._id_0669._id_13A2._id_4277;
    self._id_0669._id_13A2._id_63CE = self._id_01D0;
    self._id_01D0 = 0;
    self._id_39C7 = 0;
    self._id_01FB = 1;
    _id_A5A4::_id_2A74();
    waitframe;
    self._id_017D = 0;
}

_id_3A8B()
{
    level endon( "_stealth_detection_level_change" );
    thread _id_3A80( undefined, 1 );
    self._id_1300 = self._id_0669._id_13A2.badaccuracy;
    self.accuracy = self._id_0669._id_13A2.badaccuracy;
    self._id_01D0 = self._id_0669._id_13A2._id_63CE;
    self _meth_81CE( "prone", "crouch", "stand" );
    self _meth_8143();
    self._id_01FB = 0;
    self._id_01FF = 0;
    _id_A5A4::_id_2A8D();
    _id_A5A4::_id_309A();
    self._id_2AF3 = 1;
    self._id_2B0E = 1;
    self _meth_81A7( 0 );
}

_id_3A80( var_0, var_1 )
{
    self endon( "death" );

    if ( self._id_0669._id_5836._id_8AF2 != "prone" )
        return;

    _id_A5A4::_id_32DE( "_stealth_custom_anim" );

    if ( isdefined( var_1 ) && var_1 )
        var_2 = "prone_2_stand";
    else
        var_2 = "prone_2_run_roll";

    if ( isdefined( var_0 ) )
        self _meth_8193( "face angle", var_0[1] + 20 );

    thread _id_A510::_id_0BCA( self, "gravity", var_2 );
    var_3 = getanimlength( _id_A5A4::_id_3EF7( var_2 ) );
    wait(var_3 - 0.2);
    self notify( "stop_animmode" );
    _id_A5A4::_id_32DA( "_stealth_custom_anim" );
}

_id_3A81()
{
    self endon( "death" );
    self endon( "pain_death" );
    friendly_stance_handler_init();

    for (;;)
    {
        while ( _id_A5A4::_id_32D8( "_stealth_stance_handler" ) && !common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        {
            _id_3A87();
            var_0 = [];
            var_0 = _id_3A84( var_0 );

            if ( var_0[self._id_0669._id_5836._id_8AF2] )
                thread _id_3A82();
            else if ( _id_A5A4::_id_32D8( "_stealth_stay_still" ) )
                thread _id_3A85();
            else if ( !var_0[self._id_0669._id_13A2._id_8AFA] )
                thread _id_3A83();
            else if ( _id_A5A4::_id_32D8( "_stealth_stance_change" ) )
                self notify( "_stealth_stance_dont_change" );

            wait 0.05;
        }

        self._id_5F65 = 1;
        self _meth_81CE( "stand", "crouch", "prone" );
        thread _id_3A85();
        _id_A5A4::_id_32E0( "_stealth_stance_handler" );
        common_scripts\utility::_id_3857( "_stealth_spotted" );
    }
}

_id_3A88()
{
    if ( _id_A5A4::_id_32D8( "_stealth_stay_still" ) )
        return;

    _id_A5A4::_id_32DE( "_stealth_stay_still" );
    badplace_cylinder( "_stealth_" + self._id_0908 + "_prone", 0, self._id_02E2, 30, 90, "axis" );

    if ( self.a._id_5F5B != "stop" )
    {
        self notify( "move_interrupt" );
        animscripts\setposemovement::_id_7024();

        if ( !_id_A5A4::_id_32D8( "_stealth_stay_still" ) )
            _id_A5A4::_id_32DE( "_stealth_stay_still" );

        self _meth_8193( "face current" );
    }

    self notify( "stop_loop" );
    thread _id_A510::_id_0BCE( self, "_stealth_prone_idle", undefined, "stop_loop" );
}

_id_3A85()
{
    _id_A5A4::_id_32DA( "_stealth_stay_still" );
    badplace_delete( "_stealth_" + self._id_0908 + "_prone" );
    self notify( "stop_loop" );
}

_id_3A82()
{
    self._id_5F65 = 1;
    self notify( "_stealth_stance_down" );

    switch ( self._id_0669._id_5836._id_8AF2 )
    {
        case "stand":
            self._id_5F65 = 0.7;
            self _meth_81CE( "crouch" );
            break;
        case "crouch":
            self _meth_81CE( "prone" );
            break;
        case "prone":
            _id_3A88();
            break;
    }
}

_id_3A83()
{
    self endon( "_stealth_stance_down" );
    self endon( "_stealth_stance_dont_change" );
    self endon( "_stealth_stance_handler" );

    if ( _id_A5A4::_id_32D8( "_stealth_stance_change" ) )
        return;

    _id_A5A4::_id_32DE( "_stealth_stance_change" );
    wait 1.5;
    _id_A5A4::_id_32DA( "_stealth_stance_change" );
    self._id_5F65 = 1;

    switch ( self._id_0669._id_5836._id_8AF2 )
    {
        case "prone":
            self _meth_81CE( "crouch" );
            break;
        case "crouch":
            self _meth_81CE( "stand" );
            break;
        case "stand":
            break;
    }
}

_id_3A84( var_0 )
{
    var_1 = _func_0DA( "axis", "all" );
    var_0[self._id_0669._id_5836._id_8AF2] = 0;
    var_0[self._id_0669._id_13A2._id_8AFA] = 0;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_3 = _id_3A86( var_1[var_2], self._id_0669._id_5836._id_8AF2 );
        var_4 = _id_3A86( var_1[var_2], self._id_0669._id_13A2._id_8AFA );
        var_5 = maps\_stealth_logic::_id_3A4C() + var_3;
        var_6 = maps\_stealth_logic::_id_3A4C( self._id_0669._id_13A2._id_8AFA ) + var_4;

        if ( _func_0EE( var_1[var_2]._id_02E2, self._id_02E2 ) < var_5 )
        {
            var_0[self._id_0669._id_5836._id_8AF2] = var_5;
            break;
        }

        if ( _func_0EE( var_1[var_2]._id_02E2, self._id_02E2 ) < var_6 )
            var_0[self._id_0669._id_13A2._id_8AFA] = var_6;
    }

    return var_0;
}

_id_3A87()
{
    switch ( self._id_0669._id_5836._id_8AF2 )
    {
        case "prone":
            self._id_0669._id_13A2._id_8AFA = "crouch";
            break;
        case "crouch":
            self._id_0669._id_13A2._id_8AFA = "stand";
            break;
        case "stand":
            self._id_0669._id_13A2._id_8AFA = "stand";
            break;
    }
}

_id_3A86( var_0, var_1 )
{
    var_2 = anglestoforward( var_0.angles );
    var_3 = _func_114( self._id_02E2 - var_0._id_02E2 );
    var_4 = _func_0F6( var_2, var_3 );
    var_5 = level._id_0669._id_5836._id_29A1;

    if ( var_4 > 0.3 )
        return self._id_0669._id_13A2._id_8AF8[var_5]["looking_towards"][var_1];
    else if ( var_4 < -0.7 )
        return self._id_0669._id_13A2._id_8AF8[var_5]["looking_away"][var_1];
    else
        return self._id_0669._id_13A2._id_8AF8[var_5]["neutral"][var_1];
}
#using_animtree("generic_human");

friendly_stance_handler_init()
{
    _id_A5A4::_id_32DD( "_stealth_stance_handler" );
    _id_A5A4::_id_32DD( "_stealth_stay_still" );
    _id_A5A4::_id_32DD( "_stealth_stance_change" );
    level._id_78AC["generic"]["_stealth_prone_idle"][0] = %prone_aim_5_legsstraight;
    self._id_0669._id_13A2._id_8AFA = undefined;
    self._id_0669._id_13A2._id_8AF8 = [];
    _id_3A55();
}

default_event_awareness( var_0, var_1, var_2, var_3 )
{
    level notify( "event_awareness_handler" );
    level endon( "event_awareness_handler" );
    level endon( "default_event_awareness_enders" );
    thread default_event_awareness_enders( var_1, var_2, var_3 );
    common_scripts\utility::_id_0D13( _func_0D9( "allies" ), ::default_event_awareness_ended_cleanup );
    thread default_event_awareness_killed_cleanup();

    for (;;)
    {
        var_4 = default_event_awareness_wait();
        common_scripts\utility::_id_0D13( _func_0D9( "allies" ), ::default_event_awareness_setup );
        waitframe;
        common_scripts\utility::_id_0D13( _func_0D9( "allies" ), ::default_event_awareness_handle_changes );
        common_scripts\utility::_id_383F( "_stealth_event" );
        wait 2;
        [[ var_0 ]]();
        default_event_awareness_waitclear( var_4 );
        common_scripts\utility::_id_0D13( _func_0D9( "allies" ), ::default_event_awareness_cleanup );
        common_scripts\utility::_id_3831( "_stealth_event" );
    }
}

default_event_awareness_enders( var_0, var_1, var_2 )
{
    level endon( "default_event_awareness_enders" );
    level endon( "event_awareness_handler" );

    if ( isdefined( var_0 ) && isdefined( level._id_382E[var_0] ) && common_scripts\utility::_id_382E( var_0 ) )
        level notify( "default_event_awareness_enders" );

    if ( isdefined( var_1 ) && isdefined( level._id_382E[var_1] ) && common_scripts\utility::_id_382E( var_1 ) )
        level notify( "default_event_awareness_enders" );

    if ( isdefined( var_2 ) && isdefined( level._id_382E[var_2] ) && common_scripts\utility::_id_382E( var_2 ) )
        level notify( "default_event_awareness_enders" );

    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        level notify( "default_event_awareness_enders" );

    level common_scripts\utility::_id_A069( "end_event_awareness_handler", "_stealth_spotted", var_0, var_1, var_2 );
    level notify( "default_event_awareness_enders" );
}

default_event_awareness_killed_cleanup()
{
    level common_scripts\utility::_id_A087( "event_awareness_handler", "default_event_awareness_enders" );
    common_scripts\utility::_id_3831( "_stealth_event" );
}

default_event_awareness_ended_cleanup()
{
    level endon( "event_awareness_handler" );
    level waittill( "default_event_awareness_enders" );
    _id_A5A4::_id_32DA( "_stealth_stance_handler" );

    if ( common_scripts\utility::_id_382E( "_stealth_spotted" ) )
        return;

    if ( isdefined( self._id_0669._id_13A2.alreadyignoreme ) && self._id_0669._id_13A2.alreadyignoreme )
        self._id_01FF = 1;
}

default_event_awareness_setup()
{
    self._id_0669._id_13A2.alreadysmartstance = _id_A5A4::_id_32D8( "_stealth_stance_handler" );
    self._id_0669._id_13A2.alreadyignoreme = self._id_01FF;
    _id_A5A4::_id_32DE( "_stealth_stance_handler" );
    self._id_01FF = 0;
}

default_event_awareness_handle_changes()
{
    self endon( "default_event_awareness_cleanup" );
    level endon( "default_event_awareness_enders" );

    for (;;)
    {
        self waittill( "_stealth_stance_handler" );
        self._id_0669._id_13A2.alreadysmartstance = _id_A5A4::_id_32D8( "_stealth_stance_handler" );

        if ( !_id_A5A4::_id_32D8( "_stealth_stance_handler" ) )
        {
            _id_A5A4::_id_32DE( "_stealth_stance_handler" );
            wait 0.05;
        }
    }
}

default_event_awareness_cleanup()
{
    self notify( "default_event_awareness_cleanup" );

    if ( !self._id_0669._id_13A2.alreadysmartstance )
        _id_A5A4::_id_32DA( "_stealth_stance_handler" );

    if ( isdefined( self._id_0669._id_13A2.alreadyignoreme ) && self._id_0669._id_13A2.alreadyignoreme )
        self._id_01FF = 1;
}

default_event_awareness_wait()
{
    level endon( "_stealth_found_corpse" );

    for (;;)
    {
        level waittill( "event_awareness", var_0 );

        switch ( var_0 )
        {
            case "found_corpse":
                return var_0;
            case "heard_corpse":
                return var_0;
            case "heard_scream":
                return var_0;
            case "explode":
                return var_0;
            default:
                continue;
        }
    }
}

default_event_awareness_waitclear( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        var_1 = _func_0DA( "axis", "all" );
        var_2 = level._id_0669._id_5836._id_298E["alert"]["crouch"];
        common_scripts\utility::_id_0D13( var_1, ::default_event_awareness_waitclear_ai, var_2 );
        _id_A5A4::_id_0D18( var_1, "default_event_awareness_waitclear_ai" );
    }

    if ( common_scripts\utility::_id_382E( "_stealth_found_corpse" ) )
    {
        var_1 = _func_0DA( "axis", "all" );
        var_2 = level._id_0669._id_5836._id_298E["alert"]["stand"];
        common_scripts\utility::_id_0D13( var_1, ::default_event_awareness_waitclear_ai, var_2 );
        _id_A5A4::_id_0D18( var_1, "default_event_awareness_waitclear_ai" );
    }
}

default_event_awareness_waitclear_ai( var_0 )
{
    default_event_awareness_waitclear_ai_proc( var_0 );
    self notify( "default_event_awareness_waitclear_ai" );
}

default_event_awareness_waitclear_ai_proc( var_0 )
{
    self endon( "death" );
    waitframe;
    var_1 = 0;

    if ( isdefined( self._id_32D8["_stealth_behavior_first_reaction"] ) )
        var_1 = _id_A5A4::_id_32D8( "_stealth_behavior_first_reaction" );

    var_2 = 0;

    if ( isdefined( self._id_32D8["_stealth_behavior_reaction_anim"] ) )
        var_1 = _id_A5A4::_id_32D8( "_stealth_behavior_reaction_anim" );

    if ( !var_1 && !var_2 )
        return;

    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "death" );
    _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "going_back" );
    level _id_A5A4::_id_07BE( common_scripts\utility::_id_384A, "_stealth_found_corpse" );
    _id_A5A4::_id_2BDD();
    self endon( "goal" );
    var_3 = var_0 * var_0;

    while ( _func_0F0( self._id_02E2, level._id_6F7C._id_02E2 ) < var_3 )
        wait 1;
}

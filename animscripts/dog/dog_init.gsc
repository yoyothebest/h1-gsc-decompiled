// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self _meth_8117( #animtree );
    _id_4DAB();
    animscripts\init::_id_381E();
    self._id_0201 = 1;
    self._id_02AD = 0;
    self._id_1CA5 = 0;
    self._id_02C1 = 1;
    self._id_75DF = %root;
    self._id_0278 = 0;
    thread _id_7FA9();
    self.a = spawnstruct();
    self.a._id_6E5A = "stand";
    self.a._id_60DD = 0;
    self.a._id_5F5B = "run";
    animscripts\init::_id_7DBE();
    self._id_8FEC = 1;
    self._id_2AF3 = 0;
    self._id_0411 = anim._id_2CDE;
    self._id_04E7 = 0;
    self._id_04CB = 0.2;
    thread animscripts\combat_utility::_id_5E5E();
    self._id_02F6 = 512;
    self _meth_8174( "dog" );
    self._id_01E6 = _func_0BC( anim._id_2CA4 * self._id_01E6 );
}

_id_7FA9()
{
    self endon( "death" );

    for (;;)
    {
        if ( isdefined( self._id_0142 ) && _func_1AD( self._id_0142 ) )
            self._id_0278 = anim._id_2CC3;
        else
            self._id_0278 = anim._id_2CC1;

        self waittill( "enemy" );
    }
}

_id_4DAB()
{
    if ( !isdefined( level._id_2CDB ) )
    {
        level._id_2CDB = 1;
        precachestring( &"SCRIPT_PLATFORM_DOG_DEATH_DO_NOTHING" );
        precachestring( &"SCRIPT_PLATFORM_DOG_DEATH_TOO_LATE" );
        precachestring( &"SCRIPT_PLATFORM_DOG_DEATH_TOO_SOON" );
        precachestring( &"SCRIPT_PLATFORM_DOG_HINT" );
        precachestring( &"SCRIPT_PLATFORM_DOG_HINT_KEYBOARD" );
        precachestring( &"NEW_DOG_DEATH_DO_NOTHING_ALT" );
        precachestring( &"NEW_DOG_DEATH_TOO_LATE_ALT" );
        precachestring( &"NEW_DOG_DEATH_TOO_SOON_ALT" );
    }

    if ( isdefined( anim._id_61F9 ) )
        return;

    precacheshader( "hud_dog_melee" );
    precacheshader( "h1_dog_melee_prompt_star" );
    precacheshader( "h1_hud_tutorial_blur" );
    precacheshader( "h1_hud_tutorial_border" );
    anim._id_61F9 = 1;
    anim._id_2CDE = _func_0F3( _func_092( %german_shepherd_run_stop, 0, 1 ) * 1.2 );
    anim._id_2CDC = _func_0F1( _func_092( %german_shepherd_run_start, 0, 1 ) );
    anim._id_2CC3 = 102;
    var_0 = _func_06F( ( 0, 0, 0 ), ( 0, 0, 0 ), %german_shepherd_attack_ai_01_start_a );
    anim._id_2CC1 = _func_0F1( var_0 );
    anim._id_2CE0 = [];
    anim._id_2CE0["wallhop"] = %german_shepherd_run_jump_40;
    anim._id_2CE0["window_40"] = %german_shepherd_run_jump_window_40;
    anim._id_2CE0["jump_down_40"] = %german_shepherd_traverse_down_40;
    anim._id_2CE0["jump_up_40"] = %german_shepherd_traverse_up_40;
    anim._id_2CE0["jump_up_80"] = %german_shepherd_traverse_up_80;
    anim.dogstartmoveangles[8] = 0;
    anim.dogstartmoveangles[6] = 90;
    anim.dogstartmoveangles[4] = -90;
    anim.dogstartmoveangles[3] = 180;
    anim.dogstartmoveangles[1] = -180;
    anim.dogstartmoveanim[8] = %german_shepherd_run_start;
    anim.dogstartmoveanim[6] = %german_shepherd_run_start_l;
    anim.dogstartmoveanim[4] = %german_shepherd_run_start_r;
    anim.dogstartmoveanim[3] = %german_shepherd_run_start_180_l;
    anim.dogstartmoveanim[1] = %german_shepherd_run_start_180_r;
    anim._id_2CD2["attackIdle"][2] = %german_shepherd_attack_look_down;
    anim._id_2CD2["attackIdle"][4] = %german_shepherd_attack_look_left;
    anim._id_2CD2["attackIdle"][6] = %german_shepherd_attack_look_right;
    anim._id_2CD2["attackIdle"][8] = %german_shepherd_attack_look_up;
    anim._id_2CD2["normal"][2] = %german_shepherd_look_down;
    anim._id_2CD2["normal"][4] = %german_shepherd_look_left;
    anim._id_2CD2["normal"][6] = %german_shepherd_look_right;
    anim._id_2CD2["normal"][8] = %german_shepherd_look_up;
    level._id_058F["dog_bite_blood"] = loadfx( "impacts/deathfx_dogbite" );
    level._id_058F["deathfx_bloodpool"] = loadfx( "impacts/deathfx_bloodpool_view" );
    var_1 = 5;
    var_2 = [];

    for ( var_3 = 0; var_3 <= var_1; var_3++ )
        var_2[var_2.size] = var_3 / var_1;

    level._id_2CAF = 0;
    level._id_2CB0 = common_scripts\utility::_id_0CF5( var_2 );
    setdvar( "friendlySaveFromDog", "0" );
}

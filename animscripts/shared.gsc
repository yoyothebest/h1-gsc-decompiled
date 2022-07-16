// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_6869( var_0, var_1, var_2 )
{
    self notify( "weapon_position_change" );
    var_3 = self._id_051D[var_0]._id_0329;

    if ( var_1 != "none" && self.a._id_A2E2[var_1] == var_0 )
        return;

    _id_297F();

    if ( var_3 != "none" )
        _id_2985( var_0 );

    if ( var_1 == "none" )
    {
        _id_9AF6();
        return;
    }

    if ( self.a._id_A2E2[var_1] != "none" )
        _id_2985( self.a._id_A2E2[var_1] );
    else if ( isdefined( self._id_051D["none"] ) )
        self._id_051D["none"]._id_0329 = "none";

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    if ( var_2 && ( var_1 == "left" || var_1 == "right" ) )
    {
        _id_0E0C( var_0, var_1 );
        self._id_0513 = var_0;
    }
    else
        _id_0E0C( var_0, var_1 );

    _id_9AF6();
}

_id_2985( var_0 )
{
    self.a._id_A2E2[self._id_051D[var_0]._id_0329] = "none";
    self._id_051D[var_0]._id_0329 = "none";
}

_id_0E0C( var_0, var_1 )
{
    self._id_051D[var_0]._id_0329 = var_1;
    self.a._id_A2E2[var_1] = var_0;

    if ( self.a._id_A2E3[var_1] != "none" )
    {
        self notify( "end_weapon_drop_" + var_1 );
        self.a._id_A2E3[var_1] = "none";
    }
}

_id_4168( var_0 )
{
    var_1 = self.a._id_A2E2[var_0];

    if ( var_1 == "none" )
        return self.a._id_A2E3[var_0];

    return var_1;
}

_id_297F()
{
    var_0 = [];
    var_0[var_0.size] = "right";
    var_0[var_0.size] = "left";
    var_0[var_0.size] = "chest";
    var_0[var_0.size] = "back";
    self _meth_80B5();

    foreach ( var_2 in var_0 )
    {
        var_3 = _id_4168( var_2 );

        if ( var_3 == "none" )
            continue;

        if ( _func_1B7( var_3 ) == "riotshield" && isdefined( self._id_83C7 ) )
        {
            if ( isdefined( self._id_83C1 ) && self._id_83C1 )
            {
                playfxontag( common_scripts\utility::_id_3FA8( "riot_shield_dmg" ), self, "TAG_BRASS" );
                self._id_83C1 = undefined;
            }
        }
    }

    self _meth_82D9();
}

_id_9AF6()
{
    var_0 = [];
    var_1 = [];
    var_2 = [];
    var_0[var_0.size] = "right";
    var_0[var_0.size] = "left";
    var_0[var_0.size] = "chest";
    var_0[var_0.size] = "back";

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_1[var_1.size] = _id_4168( var_0[var_3] );
        var_2[var_2.size] = _id_4102( var_0[var_3] );
    }

    self _meth_82D9( var_1[0], var_2[0], var_1[1], var_2[1], var_1[2], var_2[2], var_1[3], var_2[3] );

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        var_4 = _id_4168( var_0[var_3] );

        if ( var_4 == "none" )
            continue;

        if ( self._id_051D[var_4]._id_9BF2 && !self._id_051D[var_4]._id_4723 )
        {
            var_5 = _func_043( var_4 );
            self _meth_804A( "tag_clip", var_5 );
        }
    }

    _id_9B2D();
}

_id_9B2D()
{
    if ( isdefined( self._id_254A ) )
        [[ self._id_254A ]]();
    else
    {
        if ( self.a._id_A2E2["right"] == "none" )
            return;

        if ( _id_1AFA() )
        {
            self _meth_80B4();
            return;
        }

        self _meth_80B5();
    }
}

_id_1AFA()
{
    if ( !self.a._id_54FB )
        return 0;

    if ( animscripts\utility::_id_51A3( self._id_0513 ) )
        return 0;

    if ( !isdefined( level._id_0318._id_60E6 ) )
        return 0;

    return _func_1A1( self );
}

_id_4102( var_0 )
{
    switch ( var_0 )
    {
        case "chest":
            return "tag_weapon_chest";
        case "back":
            return "tag_stowed_back";
        case "left":
            return "tag_weapon_left";
        case "right":
            return "tag_weapon_right";
        case "hand":
            return "tag_inhand";
        default:
            break;
    }
}

_id_2F6B( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = self._id_0513;

    if ( var_0 == "none" )
        return;

    if ( isdefined( self._id_613F ) )
        return;

    _id_297F();
    var_1 = self._id_051D[var_0]._id_0329;

    if ( self._id_0135 && var_1 != "none" )
        thread _id_2F9B( var_0, var_1 );

    _id_2985( var_0 );

    if ( var_0 == self._id_0513 )
        self._id_0513 = "none";

    _id_9AF6();
}

_id_2F6C()
{
    if ( isdefined( self._id_613F ) )
        return "none";

    var_0 = [];
    var_0[var_0.size] = "left";
    var_0[var_0.size] = "right";
    var_0[var_0.size] = "chest";
    var_0[var_0.size] = "back";
    _id_297F();

    foreach ( var_2 in var_0 )
    {
        var_3 = self.a._id_A2E2[var_2];

        if ( var_3 == "none" )
            continue;

        self._id_051D[var_3]._id_0329 = "none";
        self.a._id_A2E2[var_2] = "none";

        if ( self._id_0135 )
            thread _id_2F9B( var_3, var_2 );
    }

    self._id_0513 = "none";
    _id_9AF6();
}

_id_2F9B( var_0, var_1 )
{
    if ( self _meth_81E3() )
        return "none";

    self.a._id_A2E3[var_1] = var_0;
    var_2 = var_0;

    if ( _func_120( _func_123( var_2 ), "rpg" ) )
        var_2 = "rpg_player";

    if ( _func_120( _func_123( var_2 ), "mahem" ) )
        var_2 = "iw5_mahemplayer_sp_mahemscopebase";

    self _meth_81C6( var_2, var_1, 0 );
    self endon( "end_weapon_drop_" + var_1 );
    wait 0.05;

    if ( !isdefined( self ) )
        return;

    _id_297F();
    self.a._id_A2E3[var_1] = "none";
    _id_9AF6();
}

_id_2D06( var_0, var_1, var_2, var_3 )
{
    for (;;)
    {
        self waittill( var_0, var_4 );

        if ( !isdefined( var_4 ) )
            var_4 = "undefined";

        var_5 = animscripts\notetracks::_id_466C( var_4, var_0, var_1, var_3 );

        if ( isdefined( var_5 ) )
            return var_5;
    }
}

_id_4096( var_0 )
{
    if ( !isdefined( self._id_83F6 ) )
    {
        if ( !isdefined( self._id_840F ) )
            return 0;

        return _id_3EE3( self._id_840F );
    }

    var_1 = self._id_83F6._id_02E2 + self._id_83F7 * var_0;
    return _id_3EE3( var_1 );
}

_id_3EE4()
{
    if ( !isdefined( self._id_83F6 ) )
    {
        if ( !isdefined( self._id_840F ) )
            return 0;

        return _id_3EE3( self._id_840F );
    }

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        return _id_3EE3( animscripts\combat_utility::_id_3DB2( self._id_83F6 ) );
    else
        return _id_3EE3( self._id_83F6 _meth_8099() );
}

_id_3EE2()
{
    var_0 = _id_4084();

    if ( self._id_038E == "cover_crouch" && isdefined( self.a._id_22AB ) && self.a._id_22AB == "lean" )
        var_0 -= anim._id_22A1;

    return var_0;
}

_id_4084()
{
    if ( !isdefined( self._id_83F6 ) )
    {
        if ( !isdefined( self._id_840F ) )
            return 0;

        return animscripts\combat_utility::_id_4085( self._id_840F );
    }

    if ( common_scripts\utility::_id_382E( "_cloaked_stealth_enabled" ) )
        return animscripts\combat_utility::_id_4085( animscripts\combat_utility::_id_3DB2( self._id_83F6 ) );
    else
        return animscripts\combat_utility::_id_4085( self._id_83F6 _meth_8099() );
}

_id_40C8()
{
    if ( isdefined( self._id_9C08 ) )
    {
        var_0 = self _meth_81BE();
        return ( var_0[0], var_0[1], self _meth_80AA()[2] );
    }

    if ( isdefined( self._id_9C07 ) && self._id_9C07 )
    {
        if ( self _meth_843E( "tag_flash" ) != -1 )
        {
            var_1 = self _meth_8184( "tag_flash" );

            if ( isdefined( var_1 ) )
                return var_1;
        }
    }

    return ( self._id_02E2[0], self._id_02E2[1], self _meth_80AA()[2] );
}

_id_3EE3( var_0 )
{
    var_1 = animscripts\utility::_id_4177( var_0 );
    var_2 = _func_0EE( self._id_02E2, var_0 );

    if ( var_2 > 3 )
    {
        var_3 = _func_0B9( -3 / var_2 );
        var_1 += var_3;
    }

    var_1 = _func_0EB( var_1 );
    return var_1;
}
#using_animtree("generic_human");

_id_7106( var_0 )
{
    self endon( "killanimscript" );
    _id_7107( var_0 );
    self _meth_8144( %generic_aim_left, 0.5 );
    self _meth_8144( %generic_aim_right, 0.5 );
}

_id_7107( var_0 )
{
    self endon( "rambo_aim_end" );
    waitframe;
    self _meth_8144( %generic_aim_left, 0.2 );
    self _meth_8144( %generic_aim_right, 0.2 );
    self _meth_814E( %generic_aim_45l, 1, 0.2 );
    self _meth_814E( %generic_aim_45r, 1, 0.2 );
    var_1 = 0.2;
    var_2 = 0;

    for (;;)
    {
        if ( isdefined( self._id_840F ) )
        {
            var_3 = animscripts\utility::_id_4171( self._id_840F ) - self._id_22BA.angles[1];
            var_3 = _func_0EB( var_3 - var_0 );

            if ( _func_0BE( var_3 - var_2 ) > 10 )
            {
                if ( var_3 > var_2 )
                    var_3 = var_2 + 10;
                else
                    var_3 = var_2 - 10;
            }

            var_2 = var_3;
        }

        if ( var_2 < 0 )
        {
            var_4 = var_2 / -45;

            if ( var_4 > 1 )
                var_4 = 1;

            self _meth_814E( %generic_aim_right, var_4, var_1 );
            self _meth_814E( %generic_aim_left, 0, var_1 );
        }
        else
        {
            var_4 = var_2 / 45;

            if ( var_4 > 1 )
                var_4 = 1;

            self _meth_814E( %generic_aim_left, var_4, var_1 );
            self _meth_814E( %generic_aim_right, 0, var_1 );
        }

        wait(var_1);
    }
}

_id_2741()
{
    var_0 = 0;
    var_1 = _func_1B6( self._id_0513 );

    if ( var_1 )
        var_0 = var_1;
    else if ( animscripts\weaponlist::_id_9C38() )
        var_0 = anim._id_7C7A[_func_0B2( anim._id_7C7A.size )];
    else if ( self._id_3672 )
        var_0 = anim._id_3674[_func_0B2( anim._id_3674.size )];
    else
        var_0 = anim._id_1931[_func_0B2( anim._id_1931.size )];

    if ( var_0 <= self._id_18B0 )
        return var_0;

    if ( self._id_18B0 <= 0 )
        return 1;

    return self._id_18B0;
}

_id_2742()
{
    var_0 = self._id_18B0;

    if ( _func_1B8( self._id_0513 ) == "mg" )
    {
        var_1 = _func_0B3( 10 );

        if ( var_1 < 3 )
            var_0 = _func_0B4( 2, 6 );
        else if ( var_1 < 8 )
            var_0 = _func_0B4( 6, 12 );
        else
            var_0 = _func_0B4( 12, 20 );
    }

    return var_0;
}

_id_465B( var_0 )
{
    self endon( "killanimscript" );
    self endon( "abort_reload" );
    var_1 = undefined;

    if ( self._id_051D[self._id_0513]._id_9BF2 )
        var_1 = _func_0DE( self._id_0513 );

    if ( self._id_051D[self._id_0513]._id_4723 )
    {
        if ( animscripts\utility::_id_9C3A() )
            self _meth_809C( "weap_reload_pistol_clipout_npc" );
        else
            self _meth_809C( "weap_reload_smg_clipout_npc" );

        if ( isdefined( var_1 ) )
        {
            var_2 = _func_043( self._id_0513 );
            self _meth_804A( "tag_clip", var_2 );
            thread _id_2F6E( var_1, "tag_clip" );
            self._id_051D[self._id_0513]._id_4723 = 0;
            thread _id_7448( var_1 );
        }
    }

    for (;;)
    {
        self waittill( var_0, var_3 );

        switch ( var_3 )
        {
            case "attach clip left":
            case "attach clip right":
                if ( isdefined( var_1 ) )
                {
                    self _meth_801D( var_1, "tag_inhand" );
                    thread _id_7448( var_1, "tag_inhand" );

                    if ( !self._id_051D[self._id_0513]._id_4723 )
                    {
                        var_2 = _func_043( self._id_0513 );
                        self _meth_804A( "tag_clip", var_2 );
                    }
                }

                animscripts\weaponlist::_id_72B1();
                continue;
            case "detach clip nohand":
                if ( isdefined( var_1 ) )
                    self _meth_802A( var_1, "tag_inhand" );

                continue;
            case "detach clip left":
            case "detach clip right":
                if ( isdefined( var_1 ) )
                {
                    self _meth_802A( var_1, "tag_inhand" );
                    var_2 = _func_043( self._id_0513 );
                    self _meth_804D( "tag_clip", var_2 );
                    self notify( "clip_detached" );
                    self._id_051D[self._id_0513]._id_4723 = 1;
                }

                if ( animscripts\utility::_id_9C3A() )
                    self _meth_809C( "weap_reload_pistol_clipin_npc" );
                else
                    self _meth_809C( "weap_reload_smg_clipin_npc" );

                self.a._id_6084 = 0;
                return;
        }
    }
}

_id_7448( var_0, var_1 )
{
    self notify( "clip_detached" );
    self endon( "clip_detached" );
    common_scripts\utility::_id_A069( "killanimscript", "abort_reload" );

    if ( !isdefined( self ) )
        return;

    if ( isdefined( var_1 ) )
        self _meth_802A( var_0, var_1 );

    if ( _func_1A1( self ) )
    {
        if ( self._id_0513 != "none" && self._id_051D[self._id_0513]._id_0329 != "none" )
        {
            var_2 = _func_043( self._id_0513 );
            self _meth_804D( "tag_clip", var_2 );
        }

        self._id_051D[self._id_0513]._id_4723 = 1;
    }
    else if ( isdefined( var_1 ) )
        _id_2F6E( var_0, var_1 );
}

_id_2F6E( var_0, var_1 )
{
    var_2 = spawn( "script_model", self _meth_8184( var_1 ) );
    var_2 _meth_80B3( var_0 );
    var_2.angles = self _meth_8185( var_1 );
    var_2 _meth_82BE( var_2._id_02E2, ( 0, 0, 0 ) );
    wait 10;

    if ( isdefined( var_2 ) )
        var_2 delete();
}

_id_5F94( var_0, var_1 )
{
    self endon( "killanimscript" );
    var_2 = var_0._id_02E2;
    var_3 = _func_0F0( self._id_02E2, var_2 );

    if ( var_3 < 1 )
    {
        self _meth_81CB( var_2 );
        return;
    }

    if ( var_3 > 256 && !self _meth_81C7( var_2, !self._id_0424 ) )
        return;

    self._id_0231 = 1;
    var_4 = _func_0EE( self._id_02E2, var_2 );
    var_5 = _func_0BC( var_1 * 20 );

    for ( var_6 = 0; var_6 < var_5; var_6++ )
    {
        var_2 = var_0._id_02E2;
        var_7 = self._id_02E2 - var_2;
        var_7 = _func_114( var_7 );
        var_8 = var_2 + var_7 * var_4;
        var_9 = var_8 + ( var_2 - var_8 ) * ( var_6 + 1 ) / var_5;
        self _meth_81CB( var_9 );
        wait 0.05;
    }

    self._id_0231 = 0;
}

_id_74E2()
{
    return 1;
}

_id_6DC1( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ::_id_74E2;

    for ( var_3 = 0; var_3 < var_1 * 10; var_3++ )
    {
        if ( _func_1A1( self._id_0142 ) )
        {
            if ( animscripts\utility::_id_1AE1() && [[ var_2 ]]() )
                return;
        }

        if ( animscripts\utility::_id_51C3() && [[ var_2 ]]() )
            return;

        self _meth_8149( var_0, %body, 1, 0.1 );
        wait 0.1;
    }
}

_id_933A( var_0 )
{
    self endon( "killanimscript" );
    self _meth_8192( "angle deltas" );
    self _meth_8112( "weapon swap", var_0, %body, 1, 0.1, 1 );
    thread animscripts\combat_utility::_id_7066();
    _id_2D06( "weapon swap" );
    _id_A537::_id_2A4D();
}

_id_766B()
{
    var_0 = _id_766D();

    if ( var_0 == 0 )
        return;

    self endon( "tracksuit_removed" );
    self endon( "death" );

    for (;;)
    {
        level waittill( "an_enemy_shot", var_1 );

        if ( var_1 != self )
            continue;

        if ( !isdefined( var_1._id_0142 ) )
            continue;

        if ( var_1._id_0142 != level._id_0318 )
            continue;

        if ( isdefined( level._id_243A ) && level._id_243A == 0 )
            continue;

        thread _id_766C();
        var_0--;

        if ( var_0 <= 0 )
            return;
    }
}

_id_766D()
{
    var_0 = _id_A5A4::_id_3F58();

    switch ( var_0 )
    {
        case "easy":
        case "gimp":
            return 2;
        case "medium":
        case "hard":
        case "difficult":
            return 1;
        case "fu":
            return 0;
    }

    return 2;
}

_id_766C()
{
    var_0 = _func_1A5( level._id_0318, 5000, 800 );
    wait 4.0;
    _func_1A7( var_0 );
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_271E()
{
    var_0 = _func_0C5();
    var_1 = 0;
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
    {
        if ( !( var_0[var_3]._id_03DA & 2 ) && ( isdefined( var_0[var_3]._id_04A4 ) && _func_0C4( var_0[var_3]._id_04A4, "targetname" ).size > 0 || isdefined( var_0[var_3]._id_04A6 ) && _func_0C4( var_0[var_3]._id_04A6, "target" ).size > 0 ) )
        {
            var_2[var_1] = var_0[var_3];
            var_1++;
        }
    }

    var_4 = 0;

    for (;;)
    {
        if ( getdvar( "chain" ) == "1" )
        {
            for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            {
                if ( _func_0EE( level._id_0318 _meth_8097(), var_2[var_3]._id_02E2 ) < 1500 )
                {

                }
            }

            var_5 = _func_0D9( "allies" );

            for ( var_3 = 0; var_3 < var_5.size; var_3++ )
            {
                var_6 = var_5[var_3] animscripts\utility::_id_3F2F();

                if ( isdefined( var_6 ) )
                {

                }
            }
        }

        waittillframeend;
    }
}

_id_2695( var_0 )
{
    var_1 = _func_0D9();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_81B5() != var_0 )
            continue;

        var_1[var_2] thread _id_2696();
        break;
    }
}

_id_270B( var_0 )
{
    var_1 = _func_0D9();

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] _meth_81B5() != var_0 )
            continue;

        var_1[var_2] notify( "stop_drawing_enemy_pos" );
        break;
    }
}

_id_2696()
{
    self endon( "death" );
    self endon( "stop_drawing_enemy_pos" );

    for (;;)
    {
        wait 0.05;

        if ( _func_1A1( self._id_0142 ) )
        {

        }

        if ( !animscripts\utility::_id_472C() )
            continue;

        var_0 = animscripts\utility::_id_3F7E();
    }
}

_id_2697()
{
    var_0 = _func_0D9();
    var_1 = undefined;

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_1 = var_0[var_2];

        if ( !_func_1A1( var_1 ) )
            continue;

        if ( isdefined( var_1._id_0247 ) )
        {

        }

        if ( isdefined( var_1._id_4279 ) )
        {
            if ( var_1 _meth_813F() )
                var_3 = ( 1, 0, 0 );
            else
                var_3 = ( 0, 0, 1 );

            var_4 = var_1._id_02E2 + ( 0, 0, 54 );

            if ( isdefined( var_1._id_02BB ) )
            {
                if ( var_1._id_02BB._id_04D9 == "Cover Left" )
                {
                    var_5 = 1;
                    var_4 = anglestoright( var_1._id_02BB.angles );
                    var_4 *= -32;
                    var_4 = ( var_4[0], var_4[1], 64 );
                    var_4 = var_1._id_02BB._id_02E2 + var_4;
                }
                else if ( var_1._id_02BB._id_04D9 == "Cover Right" )
                {
                    var_5 = 1;
                    var_4 = anglestoright( var_1._id_02BB.angles );
                    var_4 *= 32;
                    var_4 = ( var_4[0], var_4[1], 64 );
                    var_4 = var_1._id_02BB._id_02E2 + var_4;
                }
            }

            common_scripts\utility::_id_2D9F( var_4, var_1._id_4279, var_3 );
        }
    }

    if ( 1 )
        return;

    if ( !_func_1A1( var_1 ) )
        return;

    if ( _func_1A1( var_1._id_0142 ) )
    {

    }

    if ( isdefined( var_1._id_0247 ) )
    {

    }

    if ( _func_1A1( var_1._id_4278 ) )
    {

    }

    if ( !var_1 animscripts\utility::_id_472C() )
        return;

    var_6 = var_1 animscripts\utility::_id_3F7E();

    if ( isdefined( var_1._id_4279 ) )
        return;
}

_id_2DD5( var_0 )
{

}

_id_2DE7( var_0, var_1, var_2 )
{
    var_3 = self _meth_8184( var_0 );
    var_4 = self _meth_8185( var_0 );
    _id_2DD0( var_3, var_4, var_1, var_2 );
}

_id_2DDE( var_0 )
{
    var_1 = undefined;
    var_2 = undefined;

    for (;;)
    {
        if ( isdefined( self ) )
        {
            var_1 = self._id_02E2;
            var_2 = self.angles;
            _id_2DD0( var_1, var_2, var_0 );
        }

        wait 0.05;
    }
}

_id_2DD1( var_0, var_1 )
{
    for (;;)
    {
        _id_2DD0( var_0, var_1 );
        wait 0.05;
    }
}

_id_2DDF()
{
    while ( isdefined( self ) )
    {
        _id_2DD0( self._id_02E2, self.angles );
        wait 0.05;
    }
}

_id_2DD0( var_0, var_1, var_2, var_3 )
{
    var_4 = 10;
    var_5 = anglestoforward( var_1 );
    var_6 = var_5 * var_4;
    var_7 = var_5 * ( var_4 * 0.8 );
    var_8 = anglestoright( var_1 );
    var_9 = var_8 * ( var_4 * -0.2 );
    var_10 = var_8 * ( var_4 * 0.2 );
    var_11 = anglestoup( var_1 );
    var_8 *= var_4;
    var_11 *= var_4;
    var_12 = ( 0.9, 0.2, 0.2 );
    var_13 = ( 0.2, 0.9, 0.2 );
    var_14 = ( 0.2, 0.2, 0.9 );

    if ( isdefined( var_2 ) )
    {
        var_12 = var_2;
        var_13 = var_2;
        var_14 = var_2;
    }

    if ( !isdefined( var_3 ) )
        var_3 = 1;
}

_id_2DD6( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 100;

    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 1, 0 );

    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        var_2 = anglestoforward( self.angles );
        wait 0.05;
    }
}

_id_2DE1()
{
    for (;;)
    {
        _id_2DD0( level._id_0318._id_02E2, level._id_0318 _meth_8338(), ( 1, 1, 1 ) );
        wait 0.05;
    }
}

_id_2DE8( var_0, var_1 )
{
    for (;;)
    {
        if ( !isdefined( self ) )
            return;

        _id_2DE7( var_0, var_1 );
        wait 0.05;
    }
}

_id_2DE9( var_0, var_1 )
{
    for (;;)
    {
        if ( !isdefined( self._id_02E2 ) )
            break;

        _id_2DE7( var_0, var_1, 1000 );
        wait 0.05;
    }
}

_id_2D9E( var_0, var_1 )
{
    self endon( "death" );

    for (;;)
    {
        if ( !isdefined( self ) )
            break;

        if ( !isdefined( self._id_02E2 ) )
            break;

        _id_2DE7( var_0, var_1 );
        wait 0.05;
    }
}

_id_9E20( var_0, var_1 )
{
    if ( var_0 == "ai" )
    {
        var_2 = _func_0D9();

        for ( var_3 = 0; var_3 < var_2.size; var_3++ )
            var_2[var_3] _id_2DE7( var_1 );
    }
}

_id_2689()
{
    level._id_0318._id_01FF = 1;
    var_0 = _func_0C5();
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2]._id_04D9 == "Cover Left" )
            var_1[var_1.size] = var_0[var_2];

        if ( var_0[var_2]._id_04D9 == "Cover Right" )
            var_1[var_1.size] = var_0[var_2];
    }

    var_3 = _func_0D9();

    for ( var_2 = 0; var_2 < var_3.size; var_2++ )
        var_3[var_2] delete();

    level._id_2735 = _func_0DB();
    level._id_0721 = [];
    level._id_20D4 = [];

    for ( var_2 = 0; var_2 < level._id_2735.size; var_2++ )
        level._id_2735[var_2]._id_04A6 = "blah";

    var_4 = 0;

    for ( var_2 = 0; var_2 < 30; var_2++ )
    {
        if ( var_2 >= var_1.size )
            break;

        var_1[var_2] thread _id_22C6();
        var_4++;
    }

    if ( var_1.size <= 30 )
        return;

    for (;;)
    {
        level waittill( "debug_next_corner" );

        if ( var_4 >= var_1.size )
            var_4 = 0;

        var_1[var_4] thread _id_22C6();
        var_4++;
    }
}

_id_22C6()
{
    _id_22C2();
}

_id_22C2()
{
    var_0 = undefined;
    var_1 = undefined;

    for (;;)
    {
        for ( var_2 = 0; var_2 < level._id_2735.size; var_2++ )
        {
            wait 0.05;
            var_1 = level._id_2735[var_2];
            var_3 = 0;

            for ( var_4 = 0; var_4 < level._id_0721.size; var_4++ )
            {
                if ( _func_0EE( level._id_0721[var_4]._id_02E2, self._id_02E2 ) > 250 )
                    continue;

                var_3 = 1;
                break;
            }

            if ( var_3 )
                continue;

            var_5 = 0;

            for ( var_4 = 0; var_4 < level._id_20D4.size; var_4++ )
            {
                if ( level._id_20D4[var_4] != self )
                    continue;

                var_5 = 1;
                break;
            }

            if ( var_5 )
                continue;

            level._id_0721[level._id_0721.size] = self;
            var_1._id_02E2 = self._id_02E2;
            var_1.angles = self.angles;
            var_1.count = 1;
            var_0 = var_1 _meth_8096();

            if ( _id_A5A4::_id_88F1( var_0 ) )
            {
                _id_7393( self );
                continue;
            }

            break;
        }

        if ( _func_1A1( var_0 ) )
            break;
    }

    wait 1;

    if ( _func_1A1( var_0 ) )
    {
        var_0._id_01FF = 1;
        var_0._id_04A7 = "neutral";
        var_0 _meth_81AA( var_0._id_02E2 );
        thread _id_2426( self._id_02E2 );
        var_0 thread _id_A5A4::_id_272C();
        thread _id_2427( var_0 );
        var_0 waittill( "death" );
    }

    _id_7393( self );
    level._id_20D4[level._id_20D4.size] = self;
}

_id_7393( var_0 )
{
    var_1 = [];

    for ( var_2 = 0; var_2 < level._id_0721.size; var_2++ )
    {
        if ( level._id_0721[var_2] == var_0 )
            continue;

        var_1[var_1.size] = level._id_0721[var_2];
    }

    level._id_0721 = var_1;
}

_id_2426( var_0 )
{
    for (;;)
        wait 0.05;
}

_id_2427( var_0 )
{
    var_1 = undefined;

    while ( _func_1A1( var_0 ) )
    {
        var_1 = var_0._id_02E2;
        wait 0.05;
    }

    for (;;)
        wait 0.05;
}

_id_272A()
{
    self notify( "stopdebugmisstime" );
    self endon( "stopdebugmisstime" );
    self endon( "death" );

    for (;;)
    {
        if ( self.a._id_5CE3 <= 0 )
        {

        }
        else
        {

        }

        wait 0.05;
    }
}

_id_272B()
{
    self notify( "stopdebugmisstime" );
}

_id_7F61( var_0, var_1 )
{

}

_id_2727( var_0 )
{

}

_id_598E( var_0, var_1, var_2, var_3, var_4 )
{
    return var_3 + ( var_0 - var_1 ) * ( var_4 - var_3 ) / ( var_2 - var_1 );
}

_id_5F5E()
{

}

_id_5F5C()
{

}

_id_8AED()
{

}

_id_3D3F()
{
    var_0 = anglestoforward( self.angles );
    var_1 = _id_A57B::_id_3D3E();

    if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return "none";

    if ( _func_0F1( var_1 ) == 0 )
        var_1 = self._id_0500;

    var_2 = _func_0F6( _func_114( var_0 ), _func_114( var_1 ) );
    var_2 = _func_0E9( var_2, -1, 1 );
    var_3 = _func_0BA( var_2 );

    if ( var_3 > 135 )
        return "back";
    else if ( var_3 < 45 )
        return "forward";
    else if ( var_3 > 45 && var_3 < 135 )
        return "left";
    else
        return "right";
}

_id_4D61()
{
    var_0 = [];
    var_0[0] = "Invalid";
    var_0[1] = "Exposed";
    var_0[2] = "Turret";
    var_0[3] = "Grenade_Response";
    var_0[4] = "Badplace";
    var_0[5] = "Cover_Arrival";
    var_0[6] = "Death";
    var_0[7] = "Pain";
    var_0[8] = "Flashed";
    var_0[9] = "Scripted_Anim";
    var_0[10] = "Custom_Anim";
    var_0[11] = "Negotiation";
    return var_0;
}

_id_8D60( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 99;

    switch ( var_0 )
    {
        case "death":
            return 0;
        case "scripted":
            return 1;
        case "traverse":
            return 2;
        case "combat":
            return 3;
        case "patrol":
            return 4;
        case "stealth":
            return 5;
        case "cover_arrival":
            return 6;
        case "cover":
            return 7;
        case "flashed":
            return 8;
        case "reaction":
            return 9;
        case "pain":
            return 10;
        case "init":
            return 11;
        case "move":
            return 12;
        case "stop":
            return 13;
        case "grenade_cower":
            return 14;
        case "grenade_return_throw":
            return 15;
        case "cover_crouch":
        case "cover_stand":
        case "cover_left":
        case "cover_right":
        case "cover_prone":
        case "cover_multi":
        case "cover_swim_left":
        case "cover_swim_right":
        case "cover_swim_up":
        case "<custom>":
            return 16;
        default:
            return 99;
    }
}

_id_7ADF( var_0, var_1 )
{
    return _id_8D60( var_0 ) < _id_8D60( var_1 );
}

_id_7AF7( var_0 )
{
    var_1 = [];

    if ( !_func_0CF( var_0 ) )
    {
        var_1 = common_scripts\utility::_id_0CDA( var_1, "Undefined" );
        return var_1;
    }

    if ( !isdefined( var_0._id_038E ) )
    {
        var_1 = common_scripts\utility::_id_0CDA( var_1, "Undefined" );
        return var_1;
    }

    if ( isdefined( self._id_7A9C ) && self._id_7A9C == 1 )
        var_1 = common_scripts\utility::_id_0CDA( var_1, "patrol" );

    if ( isdefined( self._id_51DA ) && self._id_51DA )
        var_1 = common_scripts\utility::_id_0CDA( var_1, "traverse" );

    if ( isdefined( self._id_056F ) && self._id_056F != "default_stealth_state" )
        var_1 = common_scripts\utility::_id_0CDA( var_1, "stealth" );

    switch ( var_0._id_038E )
    {
        case "stop":
        case "move":
        case "flashed":
        case "death":
        case "combat":
        case "pain":
        case "init":
        case "reaction":
        case "scripted":
        case "cover_arrival":
        case "grenade_cower":
        case "grenade_return_throw":
        case "<custom>":
            var_1 = common_scripts\utility::_id_0CDA( var_1, var_0._id_038E );
            break;
        case "cover_crouch":
        case "cover_stand":
        case "cover_left":
        case "cover_right":
        case "cover_prone":
        case "cover_multi":
        case "cover_swim_left":
        case "cover_swim_right":
        case "cover_swim_up":
            var_1 = common_scripts\utility::_id_0CDA( var_1, "cover" );
            break;
        default:
            if ( common_scripts\utility::_id_8F55( var_0._id_038E, "mantle" ) != -1 )
            {
                var_1 = common_scripts\utility::_id_0CDA( var_1, "mantle" );
                break;
            }

            var_1 = common_scripts\utility::_id_0CDA( var_1, var_0._id_038E );
            break;
    }

    if ( var_1.size > 1 )
        var_1 = common_scripts\utility::_id_0D06( var_1, ::_id_7ADF );

    return var_1;
}

_id_970D( var_0 )
{
    var_1 = " -> ";
    var_2 = common_scripts\utility::_id_8F55( var_0, var_1 );
    var_3 = _func_122( var_0, 0, var_2 );
    var_4 = _func_122( var_0, var_2 + var_1.size, var_0.size );
    var_5 = var_4 + var_1 + var_3;

    if ( isdefined( common_scripts\utility::_id_0CE8( level._id_9719, var_5 ) ) )
    {
        var_6 = [];
        var_6["reversed"] = var_5;
        var_6["new"] = var_3 + " -- " + var_4;
        return var_6;
    }

    return undefined;
}

_id_65C8( var_0 )
{

}

_id_8D5D()
{

}

_id_2722()
{

}

_id_737A()
{

}

_id_23D7()
{

}

_id_23D6()
{

}

_id_26B8()
{

}

_id_26B9()
{

}

_id_735A()
{

}

_id_23BA()
{

}

_id_6956()
{

}

_id_269F()
{

}

_id_2692()
{

}

_id_26A0()
{

}

_id_8507()
{
    var_0 = undefined;
    var_1 = undefined;
    var_0 = ( 15.1859, -12.2822, 4.071 );
    var_1 = ( 947.2, -10918, 64.9514 );

    for (;;)
    {
        wait 0.05;
        var_2 = var_0;
        var_3 = var_1;

        if ( !isdefined( var_0 ) )
            var_2 = level._id_949C;

        if ( !isdefined( var_1 ) )
            var_3 = level._id_0318 _meth_80AA();

        var_4 = _func_06B( var_2, var_3, 0, undefined );
    }
}

_id_2680()
{
    var_0 = _func_1A9();
    var_0.alignx = "left";
    var_0.aligny = "middle";
    var_0._id_0530 = 10;
    var_0._id_0538 = 100;
    var_0._id_0241 = &"DEBUG_DRONES";
    var_0.alpha = 0;
    var_1 = _func_1A9();
    var_1.alignx = "left";
    var_1.aligny = "middle";
    var_1._id_0530 = 10;
    var_1._id_0538 = 115;
    var_1._id_0241 = &"DEBUG_ALLIES";
    var_1.alpha = 0;
    var_2 = _func_1A9();
    var_2.alignx = "left";
    var_2.aligny = "middle";
    var_2._id_0530 = 10;
    var_2._id_0538 = 130;
    var_2._id_0241 = &"DEBUG_AXIS";
    var_2.alpha = 0;
    var_3 = _func_1A9();
    var_3.alignx = "left";
    var_3.aligny = "middle";
    var_3._id_0530 = 10;
    var_3._id_0538 = 145;
    var_3._id_0241 = &"DEBUG_VEHICLES";
    var_3.alpha = 0;
    var_4 = _func_1A9();
    var_4.alignx = "left";
    var_4.aligny = "middle";
    var_4._id_0530 = 10;
    var_4._id_0538 = 160;
    var_4._id_0241 = &"DEBUG_TOTAL";
    var_4.alpha = 0;
    var_5 = "off";

    for (;;)
    {
        var_6 = getdvar( "debug_character_count" );

        if ( var_6 == "off" )
        {
            if ( var_6 != var_5 )
            {
                var_0.alpha = 0;
                var_1.alpha = 0;
                var_2.alpha = 0;
                var_3.alpha = 0;
                var_4.alpha = 0;
                var_5 = var_6;
            }

            wait 0.25;
            continue;
        }
        else if ( var_6 != var_5 )
        {
            var_0.alpha = 1;
            var_1.alpha = 1;
            var_2.alpha = 1;
            var_3.alpha = 1;
            var_4.alpha = 1;
            var_5 = var_6;
        }

        var_7 = getentarray( "drone", "targetname" ).size;
        var_0 _meth_80D9( var_7 );
        var_8 = _func_0D9( "allies" ).size;
        var_1 _meth_80D9( var_8 );
        var_9 = _func_0D9( "bad_guys" ).size;
        var_2 _meth_80D9( var_9 );
        var_3 _meth_80D9( getentarray( "script_vehicle", "classname" ).size );
        var_4 _meth_80D9( var_7 + var_8 + var_9 );
        wait 0.25;
    }
}

_id_6265()
{
    if ( !self._id_0100 )
        self _meth_8054( ( 0, 0, -500 ), level._id_0318, level._id_0318 );
}

_id_26B1()
{

}

_id_1A13()
{
    wait 0.05;
    var_0 = getentarray( "camera", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = getent( var_0[var_1]._id_04A4, "targetname" );
        var_0[var_1]._id_6599 = var_2._id_02E2;
        var_0[var_1].angles = _func_115( var_2._id_02E2 - var_0[var_1]._id_02E2 );
    }

    for (;;)
    {
        var_3 = _func_0D9( "axis" );

        if ( !var_3.size )
        {
            _id_3A29();
            wait 0.5;
            continue;
        }

        var_4 = [];

        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            for ( var_5 = 0; var_5 < var_3.size; var_5++ )
            {
                if ( _func_0EE( var_0[var_1]._id_02E2, var_3[var_5]._id_02E2 ) > 256 )
                    continue;

                var_4[var_4.size] = var_0[var_1];
                break;
            }
        }

        if ( !var_4.size )
        {
            _id_3A29();
            wait 0.5;
            continue;
        }

        var_6 = [];

        for ( var_1 = 0; var_1 < var_4.size; var_1++ )
        {
            var_7 = var_4[var_1];
            var_8 = var_7._id_6599;
            var_9 = var_7._id_02E2;
            var_10 = _func_115( ( var_9[0], var_9[1], var_9[2] ) - ( var_8[0], var_8[1], var_8[2] ) );
            var_11 = ( 0, var_10[1], 0 );
            var_12 = anglestoforward( var_11 );
            var_10 = _func_114( var_9 - level._id_0318._id_02E2 );
            var_13 = _func_0F6( var_12, var_10 );

            if ( var_13 < 0.85 )
                continue;

            var_6[var_6.size] = var_7;
        }

        if ( !var_6.size )
        {
            _id_3A29();
            wait 0.5;
            continue;
        }

        var_14 = _func_0EE( level._id_0318._id_02E2, var_6[0]._id_02E2 );
        var_15 = var_6[0];

        for ( var_1 = 1; var_1 < var_6.size; var_1++ )
        {
            var_16 = _func_0EE( level._id_0318._id_02E2, var_6[var_1]._id_02E2 );

            if ( var_16 > var_14 )
                continue;

            var_15 = var_6[var_1];
            var_14 = var_16;
        }

        _id_7FED( var_15 );
        wait 3;
    }
}

_id_3A29()
{
    setdvar( "cl_freemove", "0" );
}

_id_7FED( var_0 )
{
    setdvar( "cl_freemove", "2" );
}

_id_0B9E()
{
    for (;;)
    {
        if ( getdvar( "angles", "0" ) == "1" )
            setdvar( "angles", "0" );

        wait 1;
    }
}

_id_266D()
{
    waitframe;

    for ( var_0 = 0; var_0 < 50; var_0++ )
    {
        if ( !isdefined( level._id_266C[var_0] ) )
            continue;

        var_1 = level._id_266C[var_0];

        for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        {
            var_3 = var_1[var_2];

            if ( isdefined( var_3._id_9887 ) )
                continue;
        }
    }
}

_id_55DB()
{

}

_id_A23E()
{
    precacheitem( "defaultweapon" );

    for (;;)
    {
        _id_9B37();
        wait 0.25;
    }
}

_id_9B37()
{
    var_0 = getdvarfloat( "scr_requiredMapAspectRatio", 1 );

    if ( !isdefined( level._id_5C74 ) )
    {
        setdvar( "scr_minimap_corner_targetname", "minimap_corner" );
        level._id_5C74 = "minimap_corner";
    }

    if ( !isdefined( level._id_5C75 ) )
    {
        setdvar( "scr_minimap_height", "0" );
        level._id_5C75 = 0;
    }

    var_1 = getdvarfloat( "scr_minimap_height" );
    var_2 = getdvar( "scr_minimap_corner_targetname" );

    if ( var_1 != level._id_5C75 || var_2 != level._id_5C74 )
    {
        if ( isdefined( level._id_5C77 ) )
        {
            level._id_5C78 _meth_8051();
            level._id_5C77 delete();
            level notify( "end_draw_map_bounds" );
        }

        if ( var_1 > 0 )
        {
            level._id_5C75 = var_1;
            level._id_5C74 = var_2;
            var_3 = level._id_0318;
            var_4 = getentarray( var_2, "targetname" );

            if ( var_4.size == 2 )
            {
                var_5 = var_4[0]._id_02E2 + var_4[1]._id_02E2;
                var_5 = ( var_5[0] * 0.5, var_5[1] * 0.5, var_5[2] * 0.5 );
                var_6 = ( var_4[0]._id_02E2[0], var_4[0]._id_02E2[1], var_5[2] );
                var_7 = ( var_4[0]._id_02E2[0], var_4[0]._id_02E2[1], var_5[2] );

                if ( var_4[1]._id_02E2[0] > var_4[0]._id_02E2[0] )
                    var_6 = ( var_4[1]._id_02E2[0], var_6[1], var_6[2] );
                else
                    var_7 = ( var_4[1]._id_02E2[0], var_7[1], var_7[2] );

                if ( var_4[1]._id_02E2[1] > var_4[0]._id_02E2[1] )
                    var_6 = ( var_6[0], var_4[1]._id_02E2[1], var_6[2] );
                else
                    var_7 = ( var_7[0], var_4[1]._id_02E2[1], var_7[2] );

                var_8 = var_6 - var_5;
                var_5 = ( var_5[0], var_5[1], var_5[2] + var_1 );
                var_9 = spawn( "script_origin", var_3._id_02E2 );
                var_10 = ( _func_0B7( _func_094() ), _func_0B6( _func_094() ), 0 );
                var_11 = ( var_10[1], 0 - var_10[0], 0 );
                var_12 = _func_0F6( var_10, var_8 );

                if ( var_12 < 0 )
                    var_12 = 0 - var_12;

                var_13 = _func_0F6( var_11, var_8 );

                if ( var_13 < 0 )
                    var_13 = 0 - var_13;

                if ( var_0 > 0 )
                {
                    var_14 = var_13 / var_12;

                    if ( var_14 < var_0 )
                    {
                        var_15 = var_0 / var_14;
                        var_13 *= var_15;
                        var_16 = _id_9C6E( var_11, _func_0F6( var_11, var_6 - var_5 ) * ( var_15 - 1 ) );
                        var_7 -= var_16;
                        var_6 += var_16;
                    }
                    else
                    {
                        var_15 = var_14 / var_0;
                        var_12 *= var_15;
                        var_16 = _id_9C6E( var_10, _func_0F6( var_10, var_6 - var_5 ) * ( var_15 - 1 ) );
                        var_7 -= var_16;
                        var_6 += var_16;
                    }
                }

                if ( level._id_2153 )
                {
                    var_17 = 1.77778;
                    var_18 = 2 * _func_0BB( var_13 * 0.8 / var_1 );
                    var_19 = 2 * _func_0BB( var_12 * var_17 * 0.8 / var_1 );
                }
                else
                {
                    var_17 = 1.33333;
                    var_18 = 2 * _func_0BB( var_13 * 1.05 / var_1 );
                    var_19 = 2 * _func_0BB( var_12 * var_17 * 1.05 / var_1 );
                }

                if ( var_18 > var_19 )
                    var_20 = var_18;
                else
                    var_20 = var_19;

                var_21 = var_1 - 1000;

                if ( var_21 < 16 )
                    var_21 = 16;

                if ( var_21 > 10000 )
                    var_21 = 10000;

                var_3 _meth_8081( var_9 );
                var_9._id_02E2 = var_5 + ( 0, 0, -62 );
                var_9.angles = ( 90, _func_094(), 0 );
                var_3 _meth_830B( "defaultweapon" );
                _func_0D6( "cg_fov", var_20 );
                level._id_5C78 = var_3;
                level._id_5C77 = var_9;
                thread _id_2DDA( var_5, var_7, var_6 );
            }
            else
            {

            }
        }
    }
}

_id_3F2A()
{
    var_0 = [];
    var_0 = getentarray( "minimap_line", "script_noteworthy" );
    var_1 = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
        var_1[var_2] = var_0[var_2] _id_3F29();

    return var_1;
}

_id_3F29()
{
    var_0 = [];
    var_1 = self;

    while ( isdefined( var_1 ) )
    {
        var_0[var_0.size] = var_1;

        if ( !isdefined( var_1 ) || !isdefined( var_1._id_04A4 ) )
            break;

        var_1 = getent( var_1._id_04A4, "targetname" );

        if ( isdefined( var_1 ) && var_1 == var_0[0] )
        {
            var_0[var_0.size] = var_1;
            break;
        }
    }

    var_2 = [];

    for ( var_3 = 0; var_3 < var_0.size; var_3++ )
        var_2[var_3] = var_0[var_3]._id_02E2;

    return var_2;
}

_id_9C6E( var_0, var_1 )
{
    return ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
}

_id_2DDA( var_0, var_1, var_2 )
{
    level notify( "end_draw_map_bounds" );
    level endon( "end_draw_map_bounds" );
    var_3 = var_0[2] - var_2[2];
    var_4 = _func_0F1( var_1 - var_2 );
    var_5 = var_1 - var_0;
    var_5 = _func_114( ( var_5[0], var_5[1], 0 ) );
    var_1 += _id_9C6E( var_5, var_4 * 1 / 800 * 0 );
    var_6 = var_2 - var_0;
    var_6 = _func_114( ( var_6[0], var_6[1], 0 ) );
    var_2 += _id_9C6E( var_6, var_4 * 1 / 800 * 0 );
    var_7 = ( _func_0B7( _func_094() ), _func_0B6( _func_094() ), 0 );
    var_8 = var_2 - var_1;
    var_9 = _id_9C6E( var_7, _func_0F6( var_8, var_7 ) );
    var_10 = _id_9C6E( var_7, _func_0BE( _func_0F6( var_8, var_7 ) ) );
    var_11 = var_1;
    var_12 = var_1 + var_9;
    var_13 = var_2;
    var_14 = var_2 - var_9;
    var_15 = _id_9C6E( var_1 + var_2, 0.5 ) + _id_9C6E( var_10, 0.51 );
    var_16 = var_4 * 0.003;
    var_17 = _id_3F2A();

    for (;;)
    {
        common_scripts\utility::_id_0CF0( var_17, common_scripts\utility::_id_6DF1 );
        wait 0.05;
    }
}

_id_514C( var_0 )
{
    var_1 = _func_114( var_0 - self _meth_8099() );
    var_2 = _func_114( var_0 - ( 0, 0, 24 ) - self _meth_8099() );
    var_3 = _func_0F6( var_1, var_2 );
    var_4 = anglestoforward( self _meth_8338() );
    var_5 = _func_0F6( var_4, var_1 );

    if ( var_5 > var_3 )
        return 1;
    else
        return 0;
}

_id_2687()
{
    wait 0.05;
    var_0 = _func_0D9();
    var_1 = [];
    var_1["axis"] = [];
    var_1["allies"] = [];
    var_1["neutral"] = [];

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !isdefined( var_3._id_250C ) )
            continue;

        var_1[var_3._id_04A7][var_3._id_250C] = 1;
        var_4 = ( 1, 1, 1 );

        if ( isdefined( var_3._id_79E6 ) )
            var_4 = level._id_2034[var_3._id_79E6];

        var_5 = var_3._id_250C;

        if ( isdefined( var_3._id_13A8 ) && var_3._id_13A8 == 1 )
            var_5 += " (c)";

        var_3 _id_9891();
    }

    _id_2DAA( var_1, "allies" );
    _id_2DAA( var_1, "axis" );
}

_id_2DAA( var_0, var_1 )
{
    var_2 = _func_1D3( var_0[var_1] );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = ( 1, 1, 1 );
        var_4 = level._id_2034[_func_122( var_2[var_3], 0, 1 )];

        if ( isdefined( level._id_2057[var_1][var_2[var_3]] ) )
        {
            var_5 = level._id_2057[var_1][var_2[var_3]];

            for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            {
                var_7 = "";

                if ( isdefined( var_5[var_6].classname ) && var_5[var_6].classname == "info_volume" )
                    var_7 = "V-" + var_2[var_3];
                else
                    var_7 = "N-" + var_2[var_3];

                if ( isdefined( var_5[var_6]._id_2043 ) && var_5[var_6]._id_2043 == level._id_0318 )
                    var_7 += " (p)";
            }
        }
    }
}

_id_3E91()
{
    if ( self._id_04A7 == "allies" )
    {
        if ( isdefined( self._id_02BB ) && isdefined( self._id_02BB._id_7975 ) )
            return self._id_02BB._id_7975;

        var_0 = self _meth_81AE();

        if ( isdefined( var_0 ) && isdefined( var_0._id_7975 ) )
            return var_0._id_7975;
    }

    if ( self._id_04A7 == "axis" )
    {
        if ( isdefined( self._id_02BB ) && isdefined( self._id_02BB._id_7976 ) )
            return self._id_02BB._id_7976;

        var_0 = self _meth_81AE();

        if ( isdefined( var_0 ) && isdefined( var_0._id_7976 ) )
            return var_0._id_7976;
    }
}

_id_9891()
{
    var_0 = ( 0, 0, 0 );

    if ( isdefined( self._id_02BB ) )
        var_0 = self._id_02BB._id_02E2;
    else if ( isdefined( self _meth_81AE() ) )
    {
        var_1 = self _meth_81AE();
        var_0 = var_1._id_02E2;
    }
    else
        return;

    if ( !isdefined( self._id_79E6 ) )
        return;

    var_2 = _id_3E91();

    if ( !isdefined( var_2 ) )
        return;

    if ( !_func_120( var_2, self._id_79E6 ) )
        return;
}

_id_3962()
{
    if ( getdvar( "depth_close" ) == "" )
        setdvar( "depth_close", "0" );

    if ( getdvar( "depth_far" ) == "" )
        setdvar( "depth_far", "1500" );

    var_0 = getdvarint( "depth_close" );
    var_1 = getdvarint( "depth_far" );
    _func_182( var_0, var_1, 1, 1, 1, 1, 0 );
}

_id_2738()
{
    level._id_5563 = gettime();
    thread _id_2739();
}

_id_2739()
{

}

_id_2B6B( var_0, var_1 )
{
    if ( self._id_04A7 == var_0._id_04A7 )
        return;

    var_2 = 0;
    var_2 += self._id_04B1;
    var_3 = 0;
    var_3 += var_0._id_04B1;
    var_4 = undefined;

    if ( isdefined( var_1 ) )
    {
        var_4 = self _meth_817C();

        if ( isdefined( var_4 ) )
        {
            var_3 += getthreatbias( var_1, var_4 );
            var_2 += getthreatbias( var_4, var_1 );
        }
    }

    if ( var_0._id_01FF || var_3 < -900000 )
        var_3 = "Ignore";

    if ( self._id_01FF || var_2 < -900000 )
        var_2 = "Ignore";

    var_5 = 20;
    var_6 = ( 1, 0.5, 0.2 );
    var_7 = ( 0.2, 0.5, 1 );
    var_8 = !_func_1AD( self ) && self._id_02E6;

    for ( var_9 = 0; var_9 <= var_5; var_9++ )
    {
        if ( isdefined( var_1 ) )
        {

        }

        if ( isdefined( var_4 ) )
        {

        }

        if ( var_8 )
        {

        }

        wait 0.05;
    }
}

_id_2720()
{
    level._id_2685 = [];
    level._id_2686 = [];

    for (;;)
    {
        level waittill( "updated_color_friendlies" );
        _id_2DA8();
    }
}

_id_2DA8()
{
    level endon( "updated_color_friendlies" );
    var_0 = _func_1D3( level._id_2685 );
    var_1 = [];
    var_2 = [];
    var_2[var_2.size] = "r";
    var_2[var_2.size] = "o";
    var_2[var_2.size] = "y";
    var_2[var_2.size] = "g";
    var_2[var_2.size] = "c";
    var_2[var_2.size] = "b";
    var_2[var_2.size] = "p";
    var_2[var_2.size] = "w";
    var_2[var_2.size] = "a";
    var_2[var_2.size] = "l";
    var_3 = _id_A5A4::_id_3E5A();

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
        var_1[var_2[var_4]] = 0;

    for ( var_4 = 0; var_4 < var_0.size; var_4++ )
    {
        var_5 = level._id_2685[var_0[var_4]];
        var_1[var_5]++;
    }

    for ( var_4 = 0; var_4 < level._id_2686.size; var_4++ )
        level._id_2686[var_4] _meth_808A();

    level._id_2686 = [];
    var_6 = 15;
    var_7 = 365;
    var_8 = 25;
    var_9 = 25;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        if ( var_1[var_2[var_4]] <= 0 )
            continue;

        for ( var_10 = 0; var_10 < var_1[var_2[var_4]]; var_10++ )
        {
            var_11 = _func_1A9();
            var_11._id_0530 = var_6 + 25 * var_10;
            var_11._id_0538 = var_7;
            var_11 _meth_80CE( "white", 16, 16 );
            var_11.alignx = "left";
            var_11.aligny = "bottom";
            var_11.alpha = 1;
            var_11.color = var_3[var_2[var_4]];
            level._id_2686[level._id_2686.size] = var_11;
        }

        var_7 += var_9;
    }
}

_id_6D20()
{
    for (;;)
    {
        if ( isdefined( level._id_0318._id_02BB ) )
        {

        }

        wait 0.05;
    }
}

_id_2DEA()
{
    if ( _func_1A1( self._id_2043 ) )
        return;
}

_id_2724()
{
    for (;;)
    {
        var_0 = _func_0D9();
        common_scripts\utility::_id_0D13( var_0, ::_id_9E11 );
        wait 0.05;
    }
}

_id_9E11()
{
    if ( !isdefined( self._id_01C3 ) )
        return;
}

_id_204A()
{
    wait 0.5;
    var_0 = [];
    var_0[var_0.size] = "r";
    var_0[var_0.size] = "g";
    var_0[var_0.size] = "b";
    var_0[var_0.size] = "y";
    var_0[var_0.size] = "o";
    var_0[var_0.size] = "p";
    var_0[var_0.size] = "c";
    var_0[var_0.size] = "w";
    var_0[var_0.size] = "a";
    var_0[var_0.size] = "l";

    for (;;)
    {
        for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        {
            var_2 = level._id_250D["allies"][var_0[var_1]];

            if ( isdefined( var_2 ) )
                _id_2DA9( var_2 );
        }

        wait 0.05;
    }
}

_id_2DA9( var_0 )
{
    var_1 = level._id_0D20["allies"][var_0];
    common_scripts\utility::_id_0D13( var_1, ::_id_2DEA );
}

_id_0766( var_0, var_1, var_2 )
{
    var_3 = _func_1A9();
    var_3.alignx = "left";
    var_3.aligny = "middle";
    var_3._id_0530 = var_0;
    var_3._id_0538 = var_1;
    var_3.alpha = 1;
    var_3._id_0189 = 1;
    var_3._id_0241 = var_2;
    level._id_0C84[level._id_0C84.size] = var_3;
    return var_3;
}

_id_3CBB( var_0 )
{
    if ( !isdefined( level._id_0C82[var_0._id_0C72] ) )
        return;

    if ( !isdefined( level._id_0C82[var_0._id_0C72][var_0._id_0C6C] ) )
        return;

    if ( !isdefined( level._id_0C82[var_0._id_0C72][var_0._id_0C6C][var_0._id_6177] ) )
        return;

    return level._id_0C82[var_0._id_0C72][var_0._id_0C6C][var_0._id_6177]["soundalias"];
}

_id_502E( var_0, var_1, var_2 )
{
    return isdefined( level._id_0C82[var_0][var_1][var_2]["created_by_animSound"] );
}

_id_2B41()
{
    if ( _func_0EE( level._id_0318._id_02E2, self._id_02E2 ) > 1500 )
        return;

    level._id_0C8B[level._id_0C8B.size] = self;
}

_id_2678( var_0 )
{

}

_id_2679()
{

}

_id_90D2( var_0, var_1 )
{
    if ( !isdefined( level._id_0C88 ) )
        return;

    if ( !isdefined( level._id_0C88._id_0C8A[var_1] ) )
        return;

    var_2 = level._id_0C88._id_0C8A[var_1];
    var_3 = _id_3CBB( var_2 );

    if ( !isdefined( var_3 ) || _id_502E( var_2._id_0C72, var_2._id_0C6C, var_2._id_6177 ) )
    {
        level._id_0C82[var_2._id_0C72][var_2._id_0C6C][var_2._id_6177]["soundalias"] = var_0;
        level._id_0C82[var_2._id_0C72][var_2._id_0C6C][var_2._id_6177]["created_by_animSound"] = 1;
    }
}

_id_93F1( var_0 )
{
    var_1 = "\"";

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        if ( var_0[var_2] == "\"" )
        {
            var_1 += "\\";
            var_1 += "\"";
            continue;
        }

        var_1 += var_0[var_2];
    }

    var_1 += "\"";
    return var_1;
}

_id_5770( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_2 ) )
        var_2 = ( 1, 1, 1 );

    if ( isdefined( var_5 ) )
    {
        var_5 *= 20;

        for ( var_6 = 0; var_6 < var_5; var_6++ )
            wait 0.05;
    }
    else
    {
        for (;;)
            wait 0.05;
    }
}

_id_6FA3( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "stop_print3ddraw" );

    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
        var_4 = 1;

    for (;;)
        wait 0.05;
}

_id_20D1()
{
    if ( getdvar( "credits_active" ) == "1" )
    {
        wait 7;
        setdvar( "credits_active", "0" );
        _id_A530::_id_2452();
        return;
    }

    wait 7;
    _id_A5A4::_id_60D6();
}

_id_3768( var_0 )
{

}

_id_1CA3( var_0 )
{
    if ( !isdefined( level._id_1C98 ) )
        level._id_1C98 = -1;

    if ( level._id_1C98 == var_0 )
        return;

    _id_3768( var_0 );

    if ( !isdefined( level._id_1C99 ) )
        return;

    level._id_1C98 = var_0;

    if ( !isdefined( level._id_1C97 ) )
        level._id_1C97 = level._id_1C99 common_scripts\utility::_id_8959();

    thread _id_1CA4( level._id_1C99 );
}

_id_1CA4( var_0 )
{
    level notify( "new_chasecam" );
    level endon( "new_chasecam" );
    var_0 endon( "death" );
    level._id_0318 _meth_8051();
    level._id_0318 _meth_8082( level._id_1C97, "tag_origin", 2, 0.5, 0.5 );
    wait 2;
    level._id_0318 _meth_807F( level._id_1C97, "tag_origin", 1, 180, 180, 180, 180 );

    for (;;)
    {
        wait 0.2;

        if ( !isdefined( level._id_1C99 ) )
            return;

        var_1 = level._id_1C99._id_02E2;
        var_2 = level._id_1C99.angles;
        var_3 = anglestoforward( var_2 );
        var_3 *= 200;
        var_1 += var_3;
        var_2 = level._id_0318 _meth_8338();
        var_3 = anglestoforward( var_2 );
        var_3 *= -200;
        level._id_1C97 _meth_82AA( var_1 + var_3, 0.2 );
    }
}

_id_9E16()
{
    foreach ( var_1 in level._id_2417 )
    {
        if ( isdefined( var_1._id_587B ) )
        {

        }
    }
}

_id_076C( var_0, var_1 )
{

}

_id_6F9F( var_0 )
{
    if ( !isdefined( level._id_9F04 ) )
        level._id_9F04 = 9500;

    level._id_9F04++;
    var_1 = "bridge_helpers";
    _id_076C( "origin", self._id_02E2[0] + " " + self._id_02E2[1] + " " + self._id_02E2[2] );
    _id_076C( "angles", self.angles[0] + " " + self.angles[1] + " " + self.angles[2] );
    _id_076C( "targetname", "helper_model" );
    _id_076C( "model", self._id_029C );
    _id_076C( "classname", "script_model" );
    _id_076C( "spawnflags", "4" );
    _id_076C( "_color", "0.443137 0.443137 1.000000" );

    if ( isdefined( var_0 ) )
        _id_076C( "script_noteworthy", var_0 );
}

_id_2DB1( var_0 )
{

}

_id_2DB2()
{
    var_0 = level._id_0318 _meth_8338();
    var_1 = anglestoforward( var_0 );
    var_2 = level._id_0318 _meth_80AA();
    var_3 = self _meth_80AA();
    var_4 = _func_115( var_3 - var_2 );
    var_5 = anglestoforward( var_4 );
    var_6 = _func_0F6( var_5, var_1 );
}

_id_4EA6()
{
    var_0 = getentarray( "explodable_barrel", "targetname" );
    var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( "explodable_barrel", "script_noteworthy" ) );

    if ( !var_0.size )
        return;

    foreach ( var_2 in var_0 )
    {
        var_2._id_0117 = "explodable_barrel";
        var_3 = var_2._id_029C + "2";
        precachemodel( var_3 );
        var_2 _meth_80B3( var_3 );

        if ( isdefined( var_2._id_04A4 ) )
        {
            var_4 = getent( var_2._id_04A4, "targetname" );

            if ( isdefined( var_4 ) )
                var_4._id_799A = "pre";

            var_2._id_04A6 = "destructible_toy";
        }
    }
}

_id_40E0( var_0 )
{
    common_scripts\utility::_id_2DB4( var_0, 1 );
}

_id_950A( var_0 )
{
    var_1 = _id_40E0( var_0 );
}

_id_268D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{

}

_id_2DA6( var_0, var_1, var_2, var_3 )
{

}

_id_949F( var_0 )
{

}

_id_269B()
{

}

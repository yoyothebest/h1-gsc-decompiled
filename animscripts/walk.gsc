// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_5F9C()
{
    var_0 = undefined;

    if ( isdefined( self._id_02F8 ) && _func_0F0( self._id_02E2, self._id_02F8 ) > 4096 )
        var_0 = "stand";

    var_1 = [[ self._id_1D46 ]]( var_0 );

    switch ( var_1 )
    {
        case "stand":
            if ( animscripts\setposemovement::_id_8B1C() )
                return;

            if ( isdefined( self._id_A108 ) )
            {
                animscripts\move::_id_5F7C( self._id_A108, self._id_A107 );
                return;
            }

            _id_2D8E( _id_415B( "straight" ) );
            break;
        case "crouch":
            if ( animscripts\setposemovement::_id_2497() )
                return;

            _id_2D8E( _id_415B( "crouch" ) );
            break;
        default:
            if ( animscripts\setposemovement::_id_7034() )
                return;

            self.a._id_5F5B = "walk";
            _id_2D8E( _id_415B( "prone" ) );
            break;
    }
}
#using_animtree("generic_human");

_id_2D8F( var_0 )
{
    self endon( "movemode" );
    self _meth_8144( %combatrun, 0.6 );
    self _meth_8149( %combatrun, %body, 1, 0.5, self._id_5F65 );

    if ( _func_0CE( self._id_A108 ) )
    {
        if ( isdefined( self._id_A107 ) )
            var_1 = common_scripts\utility::_id_1D3F( self._id_A108, self._id_A107 );
        else
            var_1 = self._id_A108[_func_0B2( self._id_A108.size )];
    }
    else
        var_1 = self._id_A108;

    self _meth_8154( "moveanim", var_1, 1, 0.2 );
    animscripts\shared::_id_2D06( "moveanim" );
}

_id_415B( var_0 )
{
    if ( animscripts\stairs_utility::isonstairs() )
    {
        var_1 = animscripts\stairs_utility::getstairsanimnameatgroundpos();
        return animscripts\utility::_id_402D( var_1 );
    }

    var_2 = animscripts\utility::_id_402D( var_0 );

    if ( !animscripts\utility::_id_5124() && !( isdefined( self._id_6165 ) && self._id_6165 ) && !( isdefined( self.a._id_135B ) && self.a._id_135B ) )
    {
        var_3 = animscripts\utility::_id_402D( "straight_twitch" );

        if ( isdefined( self._id_51DE ) && self._id_51DE )
        {
            var_4 = animscripts\traverse\shared::_id_403B();

            if ( var_4 == "Left" )
                var_3 = animscripts\utility::_id_402D( "straight_twitch_l" );
            else if ( var_4 == "Right" )
                var_3 = animscripts\utility::_id_402D( "straight_twitch_r" );
        }

        if ( !isdefined( self.a._id_76D4 ) )
        {
            if ( _func_0CE( var_2 ) )
                var_2 = var_2[_func_0B2( var_2.size )];

            return var_2;
        }

        if ( isdefined( var_3 ) && var_3.size > 0 )
        {
            var_5 = animscripts\utility::_id_40A6( self.a._id_76D4, 4 );

            if ( var_5 == 0 )
                return animscripts\utility::gettwitchanim( var_3 );
        }
    }

    if ( _func_0CE( var_2 ) )
        var_2 = var_2[_func_0B2( var_2.size )];

    return var_2;
}

_id_2D8E( var_0 )
{
    self endon( "movemode" );
    var_1 = self._id_5F65;

    if ( animscripts\stairs_utility::isonstairs() )
        var_1 *= 0.9;

    if ( self.a._id_6E5A == "stand" )
    {
        if ( isdefined( self._id_0142 ) )
        {
            animscripts\cqb::_id_22DF();

            if ( animscripts\stairs_utility::isonstairs() )
                var_2 = %body;
            else
                var_2 = %walk_and_run_loops;

            self _meth_8111( "walkanim", animscripts\cqb::_id_29A6(), var_2, 1, 1, var_1, 1 );
        }
        else
            self _meth_8111( "walkanim", var_0, %body, 1, 1, var_1, 1 );

        dowalkanim_initnonforwardanim();
    }
    else if ( self.a._id_6E5A == "prone" )
        self _meth_8154( "walkanim", animscripts\utility::_id_402D( "prone" ), 1, 0.3, self._id_5F65 );
    else
    {
        self _meth_8111( "walkanim", var_0, %body, 1, 1, var_1, 1 );
        dowalkanim_initnonforwardanim();
    }

    animscripts\notetracks::_id_2D0B( 0.2, "walkanim" );
    animscripts\run::_id_800D( 0 );
}

dowalkanim_initnonforwardanim()
{
    if ( animscripts\stairs_utility::isonstairs() )
        return;

    animscripts\run::_id_7FB7( animscripts\utility::_id_402D( "move_b" ), animscripts\utility::_id_402D( "move_l" ), animscripts\utility::_id_402D( "move_r" ) );
    thread animscripts\run::_id_7F3E( "walk" );
}

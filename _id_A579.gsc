// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_0C16( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( _func_0CE( var_0 ) )
    {
        foreach ( var_3 in var_0 )
        {
            var_1 = var_3.animation;
            var_3 thread _id_4B55( var_1, self );
        }
    }
    else
    {
        if ( !isdefined( var_1 ) )
            var_1 = var_0.animation;

        var_0 _id_4B55( var_1, self );
    }
}

_id_4B55( var_0, var_1 )
{
    self endon( "death" );

    if ( !isdefined( self ) )
        return;

    if ( _id_50B9( var_0 ) )
    {
        if ( _func_1A1( self ) && self._id_5680 == "generic" )
            var_1 _id_A510::_id_0BCE( self, var_0, "stop_loop" );
        else if ( _func_1A1( self ) )
            var_1 _id_A510::_id_0BE1( self, var_0, "stop_loop" );
    }
    else if ( _func_1A1( self ) && isdefined( self._id_0C72 ) && self._id_0C72 != "generic" )
        var_1 _id_A510::_id_0C24( self, var_0 );
    else if ( _func_1A1( self ) )
        var_1 _id_A510::_id_0BC9( self, var_0 );

    self notify( "anim_simple_done", var_0 );
}

_id_50B9( var_0 )
{
    if ( _id_50BA( var_0, "generic" ) )
        return 1;
    else if ( isdefined( self._id_0C72 ) && _id_50BA( var_0, self._id_0C72 ) )
        return 1;

    return 0;
}

_id_50BA( var_0, var_1 )
{
    if ( _func_0CE( level._id_78AC[var_1] ) )
    {
        if ( _func_0CE( level._id_78AC[var_1][var_0] ) )
        {
            if ( isdefined( level._id_78AC[var_1][var_0][0] ) )
            {
                self._id_5680 = var_1;
                return 1;
            }
        }
    }

    return 0;
}

_id_6215( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
    {
        level notify( var_1 );
        return;
    }

    if ( _func_0CE( var_0 ) )
    {
        while ( isdefined( var_0 ) && var_0.size > 0 )
        {
            var_0 = _id_A5A4::_id_0CFF( var_0 );
            var_0 = common_scripts\utility::_id_0D01( var_0 );
            waittillframeend;
        }
    }
    else
        var_0 waittill( "death" );

    level notify( var_1 );
}

_id_43CF( var_0, var_1, var_2 )
{
    var_3 = gettime() * 0.001;

    while ( self._id_02E2[2] > var_1[2] )
    {
        var_4 = var_2 * 0.5;
        var_5 = 1 * var_4 / 2;
        var_6 = gettime() * 0.001 - var_3;
        self._id_02E2 += ( 0, 0, var_5 * var_6 - 0.5 * var_4 * _func_0E8( var_6 ) );
        waittillframeend;
    }
}

_id_43D0( var_0, var_1, var_2 )
{
    var_3 = var_2 * 0.5;
    var_4 = 1;
    var_5 = gettime() * 0.001 - var_0;
    var_6 = var_4 * var_5 - 0.5 * var_3 * _func_0E8( var_5 );
    return ( 0, 0, var_6 );
}

_id_43CE( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );
    var_5 = gettime() * 0.001;

    if ( isdefined( self ) && !isdefined( self._id_0C9C ) )
        self._id_0C9C = 0;

    while ( isdefined( self ) && gettime() * 0.001 <= var_5 + var_2 )
    {
        self._id_5570 = self._id_02E2[2];
        self._id_02E2 = _id_0CC1( var_5, var_0, var_1, var_2, var_3, var_4 );

        if ( self._id_02E2[2] < self._id_5570 )
            self._id_0C9C = 1;

        wait 0.05;
    }

    self notify( "item_landed" );
}

_id_0CC1( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 386;

    if ( !isdefined( var_5 ) )
        var_5 = 386;

    var_7 = var_4;

    if ( self._id_0C9C )
        var_7 = var_5;

    var_8 = var_7 * 0.5;
    var_6 = var_3 * var_8 / 2;
    var_9 = gettime() * 0.001 - var_0;
    var_10 = var_6 * var_9 - 0.5 * var_8 * _func_0E8( var_9 );
    var_11 = _id_A5A4::_id_576B( var_9 / var_3, var_1, var_2 ) + ( 0, 0, var_10 );
    return var_11;
}

_id_0C3C( var_0, var_1, var_2 )
{
    if ( isdefined( var_0 ) )
        var_0 _id_A5A4::_id_0C3D();

    _id_A5A4::_id_0C3D();

    if ( isdefined( var_0 ) )
        var_0 notify( "stop_first_frame" );

    self notify( "stop_first_frame" );

    if ( isdefined( var_2 ) && var_2 && isdefined( var_0 ) )
        var_0 delete();
}

_id_311F( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = [ self ];

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_588F ) && var_2._id_588F > 0 )
            var_2._id_588F = 0;

        if ( isdefined( var_2._id_587A ) && var_2._id_587A.size > 0 )
            var_2._id_587A = [];
    }
}

_id_735F()
{
    if ( isdefined( level._id_24EC ) )
        level._id_24EC _meth_808A();
}

_id_484C()
{
    if ( isdefined( level._id_24EC ) )
        level._id_24EC.alpha = 0;
}

_id_0C17( var_0, var_1, var_2 )
{
    level waittill( var_2 );

    if ( isdefined( var_0._id_0C72 ) && var_0._id_0C72 != "generic" )
        var_0 _id_A510::_id_7F29();

    _id_0C16( var_0, var_1 );
}

_id_51FE( var_0 )
{
    if ( !isdefined( var_0 ) )
        return 0;

    if ( var_0._id_01E6 < 1 )
        return 0;

    return 1;
}

_id_A30B( var_0, var_1, var_2 )
{
    var_3 = self;

    if ( !_func_1AD( var_3 ) )
        var_3 = level._id_0318;

    if ( !isdefined( var_2 ) )
        var_2 = 1;

    var_4 = _func_1AA( var_3 );
    var_4 _meth_80CE( "white", 1280, 720 );
    var_4._id_01F3 = "fullscreen";
    var_4._id_0501 = "fullscreen";
    var_4.alpha = var_2;
    wait(var_0);
    var_4 _meth_8086( var_1 );
    var_4.alpha = 0;
}

_id_35EA( var_0, var_1, var_2, var_3 )
{
    var_4 = self;

    if ( !_func_1AD( var_4 ) )
        var_4 = level._id_0318;

    var_4._id_1171 = _func_1AA( var_4 );
    var_4._id_1171 _meth_80CE( "black", 1280, 720 );
    var_4._id_1171._id_01F3 = "fullscreen";
    var_4._id_1171._id_0501 = "fullscreen";
    var_4._id_1171.alpha = var_2;
    wait(var_0);
    var_4._id_1171 _meth_8086( var_1 );
    var_4._id_1171.alpha = var_3;
}

_id_23D4( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( _func_140() )
        var_0 += 2;

    var_7 = undefined;

    if ( isdefined( var_3 ) )
        var_7 = _id_3E40( -60, undefined, var_3, 1, var_4, var_5 );
    else
        var_7 = _id_3E40( -60, undefined, undefined, 1, var_4, var_5 );

    var_8 = var_7 _id_4ADE( var_0, var_1 );
    var_8._id_0241 = var_2;
    return var_8;
}

_id_3E40( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 0;

    var_6 = undefined;

    if ( !level._id_2153 )
        var_6 = -250;
    else if ( !isdefined( var_0 ) )
        var_6 = -225;
    else
        var_6 = var_0;

    if ( var_3 )
        var_6 = var_0;

    if ( !isdefined( var_1 ) )
        var_7 = 100;
    else
        var_7 = var_1;

    if ( isdefined( var_2 ) )
        var_8 = _func_1AA( var_2 );
    else
        var_8 = _func_1A9();

    if ( !isdefined( var_4 ) )
        var_4 = ( 0.8, 1, 0.8 );

    if ( !isdefined( var_5 ) )
        var_5 = ( 0.3, 0.6, 0.3 );

    var_8.alignx = "left";
    var_8.aligny = "middle";
    var_8._id_01F3 = "right";
    var_8._id_0501 = "top";
    var_8._id_0530 = var_6;
    var_8._id_0538 = var_7;
    var_8._id_0189 = 1.6;
    var_8.color = var_4;
    var_8._id_0188 = "objective";
    var_8._id_01BD = var_5;
    var_8._id_01BC = 1;
    var_8._id_0198 = 1;
    var_8._id_01ED = 0;
    var_8._id_01EB = 1;
    return var_8;
}

_id_4ADE( var_0, var_1 )
{
    self.alignx = "center";
    self.aligny = "top";
    self._id_01F3 = "center";
    self._id_0501 = "middle";
    self._id_0530 = var_1;
    self._id_0538 = -160 + 15 * var_0;
    self._id_0188 = "objective";
    self._id_0198 = 1;
    self._id_01ED = 1;
    self._id_01EB = 1;
    self._id_03D4 = 2;
    self._id_0189 = 1.15;
    return self;
}

_id_895A( var_0 )
{
    if ( !isdefined( level._id_5E51 ) )
        level._id_5E51 = [];

    var_1 = common_scripts\utility::_id_8959();
    var_1 _id_0B9A( self );

    if ( isdefined( var_0 ) )
        var_1._id_90BF = var_0;

    level._id_5E51[level._id_5E51.size] = var_1;
    level._id_5E51 = common_scripts\utility::_id_0D01( level._id_5E51 );
    iprintln( level._id_5E51.size );
    return var_1;
}

_id_736B( var_0 )
{
    if ( isdefined( level._id_5E51 ) )
    {
        var_1 = 0;

        foreach ( var_3 in level._id_5E51 )
        {
            if ( isdefined( var_3._id_90BF ) && var_3._id_90BF == var_0 )
            {
                var_3 delete();
                var_1++;
            }
        }

        iprintln( var_1 );
    }
}

_id_0B9A( var_0 )
{
    if ( isdefined( var_0._id_02E2 ) )
        self._id_02E2 = var_0._id_02E2;

    if ( isdefined( var_0.angles ) )
        self.angles = var_0.angles;
}

_id_0CE0( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8 )
{
    var_9 = common_scripts\utility::_id_0CDD( var_0, var_1 );

    if ( isdefined( var_2 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_2 );

    if ( isdefined( var_3 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_3 );

    if ( isdefined( var_4 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_4 );

    if ( isdefined( var_5 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_5 );

    if ( isdefined( var_6 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_6 );

    if ( isdefined( var_7 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_7 );

    if ( isdefined( var_8 ) )
        var_9 = common_scripts\utility::_id_0CDD( var_9, var_8 );

    return var_9;
}

_id_56AB( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_4 = _func_0EE( var_0, self._id_02E2 );
    var_5 = 0;
    var_6 = self._id_02E2;

    while ( var_5 < var_4 )
    {
        var_7 = _id_3FFE( self._id_02E2, var_0, var_1, var_2 );

        if ( var_7 == 0 )
            break;

        self._id_02E2 = _func_117( self._id_02E2, var_0, var_7 );

        if ( isdefined( var_3 ) )
            self.angles += var_3;

        var_5 = _func_0EE( self._id_02E2, var_6 );
        waittillframeend;
    }

    self notify( "lerp_complete" );
}

_id_3FFE( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_0EE( var_0, var_1 );

    if ( var_2 == 0 || var_4 == 0 )
        return 0;

    var_5 = var_2 / var_4 * 0.05;

    if ( var_5 > 0 )
        return var_5;
    else
        return 0;
}

_id_407F( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 1;

    if ( !isdefined( var_4 ) )
    {
        var_5 = 10;
        var_6 = 20;
        var_7 = 30;
    }
    else
    {
        var_5 = var_4;
        var_6 = var_4 + 10;
        var_7 = var_4 + 20;
    }

    var_8 = ( _func_102( gettime() * 0.001 * 0.05, var_5, var_0, var_1, var_2 ) * var_3, _func_102( gettime() * 0.001 * 0.05, var_6, var_0, var_1, var_2 ) * var_3, _func_102( gettime() * 0.001 * 0.05, var_7, var_0, var_1, var_2 ) * var_3 );
    return var_8;
}

_id_0B9D( var_0 )
{
    if ( isdefined( var_0._id_02E2 ) )
        self._id_02E2 = var_0._id_02E2;

    if ( isdefined( var_0.angles ) )
        self.angles = var_0.angles;
}

_id_27FC()
{
    self waittill( "goal" );
    self delete();
}

_id_2801()
{
    if ( !isdefined( self ) )
        return;

    self delete();
}

_id_67C6( var_0 )
{
    if ( _func_0B2( 100 ) <= var_0 )
        return 1;

    return 0;
}

_id_072C( var_0 )
{
    if ( !isdefined( self.count ) || self.count < 1 )
        self.count = 1;

    var_1 = _id_A5A4::_id_88C3( 1 );
    _id_A5A4::_id_88F1( var_1 );

    if ( isdefined( var_0 ) )
    {
        while ( !isdefined( var_1 ) )
        {
            self.count = 1;
            var_1 = _id_A5A4::_id_88C3( 1 );
            _id_A5A4::_id_88F1( var_1 );
            waittillframeend;
        }
    }

    return var_1;
}

_id_88EC( var_0, var_1, var_2 )
{
    if ( _func_0CE( var_1 ) )
        var_3 = var_1;
    else
        var_3[0] = var_1;

    var_4 = [];

    for ( var_5 = 0; var_5 < var_0; var_5++ )
    {
        var_6 = common_scripts\utility::_id_710E( var_3 );
        var_7 = var_6 _id_072C();

        if ( !isdefined( var_7 ) )
            continue;

        if ( isdefined( var_2 ) )
            var_7 _meth_81AD( var_2 );

        var_4[var_4.size] = var_7;
        wait 0.1;
    }

    return var_4;
}

_id_9806( var_0, var_1 )
{
    _id_A0C2( var_0 );

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    level notify( var_1 );
}

_id_8EE9( var_0, var_1, var_2, var_3 )
{
    self waittill( var_3 );

    if ( isdefined( var_1 ) )
        stopfxontag( var_0, var_1, var_2 );
}

_id_8EEB( var_0, var_1, var_2, var_3 )
{
    wait(var_3);

    if ( isdefined( var_1 ) )
        stopfxontag( var_0, var_1, var_2 );
}

_id_A0C2( var_0 )
{
    var_1 = getent( var_0, "targetname" );

    if ( !isdefined( var_1 ) )
        var_1 = getent( var_0, "script_noteworthy" );

    if ( !isdefined( var_1 ) )
        return;

    var_1 waittill( "trigger" );
}

_id_4BFE( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = 300;

    var_4 = [];

    foreach ( var_6 in var_0 )
    {
        if ( _func_0EE( var_6._id_02E2, var_2 ) < var_1 )
            var_4[var_4.size] = var_6;
    }

    if ( var_4.size <= 0 )
        return;

    var_4 = _func_1BA( var_4, var_2 );
    var_8 = var_2;

    foreach ( var_6 in var_4 )
    {
        if ( !isdefined( var_6 ) )
            continue;

        if ( var_6 _id_A5A8::_id_51FD() )
        {
            var_6 _meth_8053( var_6._id_01E6 * 2, var_2 );
            continue;
        }

        var_10 = _func_0EE( var_8, var_6._id_02E2 );
        var_11 = var_10 / var_3 * 0.05;
        wait(var_11);
        var_8 = var_6._id_02E2;
        var_12 = _func_114( var_6 _meth_8184( "tag_eye" ) - var_2 );
        var_12 = _func_114( var_12 + ( 0, 0, 0.2 ) );
        var_6 _meth_8024( "torso_lower", var_12 * 7000 );
        var_6 thread common_scripts\utility::_id_27CD( 2, ::_meth_8054 );
    }
}

_id_8893( var_0, var_1 )
{
    return _func_1BA( var_0, var_1, 0, 1 );
}

_id_7E1A( var_0 )
{
    if ( !_id_A5A4::_id_32DC( var_0 ) )
        _id_A5A4::_id_32DD( var_0 );

    self waittill( var_0 );
    _id_A5A4::_id_32D8( var_0 );
}

_id_9805( var_0, var_1 )
{
    if ( !common_scripts\utility::_id_3839( var_1 ) )
        common_scripts\utility::_id_383D( var_1 );

    var_2 = getentarray( var_0, "targetname" );
    var_2[0] waittill( "trigger" );
    common_scripts\utility::_id_383F( var_1 );
}

_id_3854( var_0, var_1 )
{
    var_2 = _func_0B3( 1000.0 );
    var_3 = "flag_or_timeout" + var_2;
    level endon( var_3 );
    level thread _id_A5A4::_id_61FD( var_3, var_1 );
    common_scripts\utility::_id_384A( var_0 );
}

_id_5371()
{
    self endon( "death" );
    self waittill( "bad_path" );

    if ( !isdefined( self._id_27F2 ) || !self._id_27F2 )
        self _meth_8054();
}

_id_637C( var_0, var_1, var_2 )
{
    var_3 = self _meth_8185( var_1 );
    var_4 = self _meth_8184( var_1 );

    if ( var_0 == "up" )
        return var_4 + anglestoup( var_3 ) * var_2;

    if ( var_0 == "down" )
        return var_4 + anglestoup( var_3 ) * ( var_2 * -1 );

    if ( var_0 == "right" )
        return var_4 + anglestoright( var_3 ) * var_2;

    if ( var_0 == "left" )
        return var_4 + anglestoright( var_3 ) * ( var_2 * -1 );

    if ( var_0 == "forward" )
        return var_4 + anglestoforward( var_3 ) * var_2;

    if ( var_0 == "backward" )
        return var_4 + anglestoforward( var_3 ) * ( var_2 * -1 );

    if ( var_0 == "backwardright" )
    {
        var_4 += anglestoright( var_3 ) * var_2;
        return var_4 + anglestoforward( var_3 ) * ( var_2 * -1 );
    }

    if ( var_0 == "backwardleft" )
    {
        var_4 += anglestoright( var_3 ) * ( var_2 * -1 );
        return var_4 + anglestoforward( var_3 ) * ( var_2 * -1 );
    }

    if ( var_0 == "forwardright" )
    {
        var_4 += anglestoright( var_3 ) * ( var_2 * 1 );
        return var_4 + anglestoforward( var_3 ) * var_2;
    }

    if ( var_0 == "forwardleft" )
    {
        var_4 += anglestoright( var_3 ) * ( var_2 * -1 );
        return var_4 + anglestoforward( var_3 ) * var_2;
    }
}

_id_3F35( var_0, var_1, var_2 )
{
    if ( !isdefined( var_2 ) )
        var_2 = 500000;

    var_3 = undefined;

    foreach ( var_5 in var_1 )
    {
        if ( !isdefined( var_5 ) )
            continue;

        var_6 = _func_0EE( var_5._id_02E2, var_0 );

        if ( var_6 >= var_2 )
            continue;

        var_2 = var_6;
        var_3 = var_5;
    }

    return var_3;
}

_id_4122( var_0, var_1 )
{
    var_2 = getent( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    var_2 = common_scripts\utility::_id_40FB( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    var_2 = _func_0C3( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;

    var_2 = _func_1EC( var_0, var_1 );

    if ( isdefined( var_2 ) )
        return var_2;
}

_id_4123( var_0, var_1 )
{
    var_2 = getentarray( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;

    var_2 = common_scripts\utility::_id_40FD( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;

    var_2 = _func_0C4( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;

    var_2 = _func_1ED( var_0, var_1 );

    if ( var_2.size > 0 )
        return var_2;
}

_id_5916( var_0 )
{
    var_1 = _id_A581::_id_89C1( var_0 );
    var_1._id_0C72 = "generic";
    var_1 _id_A5A4::_id_4462();
    return var_1;
}

_id_4FAF( var_0, var_1 )
{
    if ( !isdefined( level._id_0318._id_8F85 ) )
    {
        level._id_0318._id_8F85 = [];
        level._id_8F84 = 0;
    }

    var_2 = _func_1AA( level._id_0318 );
    var_2._id_0530 = 320;
    var_2._id_0538 = 325;
    var_2.alignx = "center";
    var_2.aligny = "middle";
    var_2._id_0189 = 1.5;
    var_2 _meth_80CC( var_0 );
    var_2.alpha = 0;
    var_2.color = ( 1, 1, 1 );
    var_2._id_01BD = ( 0.6, 0.6, 0.9 );
    var_2._id_01BC = 0.4;
    var_2._id_03D4 = -10;
    var_2._id_0188 = "objective";
    level._id_0318._id_8F85[level._id_0318._id_8F85.size] = var_2;
    level notify( "new_subtitle_created" );
    level._id_0318 thread _id_2838( 10, var_2, level._id_8F84 );
    level._id_0318 thread _id_84F2( var_2, level._id_8F84 );
    level._id_8F84 = ( level._id_8F84 + 1 ) % 10;

    if ( isdefined( var_1 ) )
        wait(var_1);
}

_id_84F2( var_0, var_1 )
{
    var_2 = "delete_subtitle_hud" + var_1;
    var_3 = 0;
    var_4 = 19;
    var_0 _meth_8086( 0.5 );
    var_0.alpha = 1;
    level endon( var_2 );

    while ( isdefined( var_0 ) )
    {
        level waittill( "new_subtitle_created" );
        var_3++;

        if ( !isdefined( var_0 ) )
            break;

        var_0 _meth_8088( 0.35 );
        var_0._id_0538 = 325 + var_3 * var_4;
        var_0.color = ( 1, 1, 1 );
        var_0._id_01BC = 0;
        var_0.alpha = 0.9 - var_3 / 5;
        waittillframeend;
    }
}

_id_2838( var_0, var_1, var_2 )
{
    var_3 = "delete_subtitle_hud" + var_2;
    level thread _id_A5A4::_id_61FD( var_3, var_0 );
    level waittill( var_3 );
    self._id_8F85 = common_scripts\utility::_id_0CF6( self._id_8F85, var_1 );
    var_1 _meth_808A();
}

_id_21A0( var_0 )
{
    return var_0 / 255;
}

_id_3E6F( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = var_0;
    var_11 = var_5 * var_2 + var_1;

    if ( !isdefined( var_6 ) )
        var_6 = ( 0.8, 1, 0.8 );

    if ( !isdefined( var_7 ) )
        var_7 = ( var_6[0] / 2, var_6[1] / 2, var_6[2] / 2 );

    if ( !isdefined( var_3 ) )
        var_3 = "center";

    if ( !isdefined( var_4 ) )
        var_4 = "middle";

    if ( !isdefined( var_8 ) )
        var_8 = "center";

    if ( !isdefined( var_9 ) )
        var_9 = "middle";

    var_12 = _func_1AA( level._id_0318 );
    var_12.alignx = var_3;
    var_12.aligny = var_4;
    var_12._id_01F3 = var_8;
    var_12._id_0501 = var_9;
    var_12._id_0530 = var_10;
    var_12._id_0538 = var_11;
    var_12._id_0189 = 1.6;
    var_12.color = var_6;
    var_12._id_0188 = "objective";
    var_12._id_01BD = var_7;
    var_12._id_01BC = 1;
    var_12._id_0198 = 1;
    var_12._id_01ED = 1;
    var_12._id_01EB = 1;
    return var_12;
}

_id_621E( var_0, var_1, var_2, var_3 )
{
    var_0 waittill( var_1 );
    var_2 notify( var_3 );
}

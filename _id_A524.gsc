// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    precacheshader( "damage_feedback" );
    precacheshader( "damage_feedback_headshot" );
    _id_A5A4::_id_30B2();
    _id_A5A4::_id_30B3();
    common_scripts\utility::_id_0D13( level._id_0323, ::_id_4CCF );
    common_scripts\utility::_id_0D13( level._id_0323, _id_A5A4::_id_3C8C );
    common_scripts\utility::_id_0D13( level._id_0323, ::_id_5E3F );
}

_id_4CCF()
{
    self._id_4AB7 = _func_1AA( self );
    self._id_4AB7.alignx = "center";
    self._id_4AB7.aligny = "middle";
    self._id_4AB7._id_01F3 = "center";
    self._id_4AB7._id_0501 = "middle";
    self._id_4AB7.alpha = 0;
    self._id_4AB7.archived = 1;
    self._id_4AB7 _meth_80CE( "damage_feedback", 50, 100 );
    self._id_4AB7._id_0538 = 25;
    self._id_4AB8 = _func_1AA( self );
    self._id_4AB8.alignx = "center";
    self._id_4AB8.aligny = "middle";
    self._id_4AB8._id_01F3 = "center";
    self._id_4AB8._id_0501 = "middle";
    self._id_4AB8.alpha = 0;
    self._id_4AB8.archived = 1;
    self._id_4AB8 _meth_80CE( "damage_feedback_headshot", 50, 100 );
    self._id_4AB8._id_0538 = 25;
}

_id_5E3F()
{
    _id_A5A4::_id_0749( ::_id_259E );
}

_id_8EF9()
{
    _id_A5A4::_id_733C( ::_id_259E );
}

_id_259E( var_0, var_1, var_2, var_3, var_4, var_5, var_6, var_7, var_8, var_9 )
{
    var_10 = 0;

    if ( isdefined( self._id_18A8 ) )
    {
        var_11 = [];
        var_11["MOD_PISTOL_BULLET"] = 1;
        var_11["MOD_RIFLE_BULLET"] = 1;

        if ( isdefined( var_11[var_4] ) )
        {
            if ( var_0 <= self._id_18A8 && ( !isdefined( self._id_5A7A ) || !self._id_5A7A || !isdefined( var_9 ) || !_func_120( var_9, "iw5_em1" ) ) )
                return;
        }
    }

    if ( isdefined( self._id_00FD ) && ( self._id_00FD == "head" || self._id_00FD == "helmet" ) )
        var_10 = 1;

    var_1 _id_9B0C( self, var_10 );
}

_id_9B0C( var_0, var_1 )
{
    var_2 = undefined;

    if ( isdefined( var_0._id_04A7 ) )
        var_2 = var_0._id_04A7;
    else if ( isdefined( var_0._id_7AEF ) )
        var_2 = var_0._id_7AEF;

    if ( !isdefined( var_2 ) )
        return;

    if ( var_2 == "neutral" || isdefined( self._id_04A7 ) && var_2 == self._id_04A7 )
        return;

    if ( isdefined( var_0._id_58D7 ) && var_0._id_58D7 )
        return;

    if ( isdefined( var_0._id_4257 ) && var_0._id_4257 )
        return;

    if ( isdefined( var_0._id_7A06 ) && var_0._id_7A06 )
        return;

    _id_9B0E( var_0 );
    _id_9B0D( var_1, var_0 );
}

_id_9B0E( var_0 )
{
    if ( !_id_A5A4::_id_5012() )
        return;

    if ( isdefined( var_0 ) && isdefined( var_0._id_2B02 ) && var_0._id_2B02 )
        return;

    if ( _func_1AD( self ) )
    {
        var_1 = "SP_hit_alert_npc";

        if ( _func_1CA( var_1 ) )
        {
            level._id_0318 _meth_82F1( var_1 );
            return;
        }
    }
    else if ( _func_1AD( var_0 ) )
        return;
}

_id_9B0D( var_0, var_1 )
{
    if ( !_id_A5A4::_id_5011() )
        return;

    if ( !_func_1AD( self ) )
        return;

    var_2 = 1;

    if ( isdefined( level._id_8637._id_8A56 ) )
        var_2 = level._id_8637._id_8A56;

    if ( 0 && isdefined( var_0 ) && var_0 && isdefined( var_1 ) && !_func_1A1( var_1 ) )
    {
        self._id_4AB8.alpha = 1;
        self._id_4AB8 _meth_8086( var_2 );
        self._id_4AB8.alpha = 0;
        var_3 = getdvarfloat( "cg_crosshairVerticalOffset" ) * 240;
        self._id_4AB8._id_0538 = 25 - _func_0BC( var_3 );
    }
    else
    {
        self._id_4AB7.alpha = 1;
        self._id_4AB7 _meth_8086( var_2 );
        self._id_4AB7.alpha = 0;
        var_3 = getdvarfloat( "cg_crosshairVerticalOffset" ) * 240;
        self._id_4AB7._id_0538 = 25 - _func_0BC( var_3 );
    }
}

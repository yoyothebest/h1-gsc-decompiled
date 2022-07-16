// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_7FDC( var_0 )
{
    if ( isdefined( self._id_6685 ) && self._id_6685 == var_0 )
        return;

    if ( isdefined( self._id_6685 ) )
        self._id_6685 _id_7399( self );

    self._id_6685 = var_0;
    self._id_6685 _id_07D8( self );

    if ( isdefined( self._id_6E19 ) )
        _id_7FEE( self._id_6E19, self._id_730A, self._id_A39F, self._id_A3BA );
    else
        _id_7FEE( "TOPLEFT" );
}

_id_407A()
{
    return self._id_6685;
}

_id_07D8( var_0 )
{
    var_0._id_0204 = self._id_1D3D.size;
    self._id_1D3D[self._id_1D3D.size] = var_0;
}

_id_7399( var_0 )
{
    var_0._id_6685 = undefined;

    if ( self._id_1D3D[self._id_1D3D.size - 1] != var_0 )
    {
        self._id_1D3D[var_0._id_0204] = self._id_1D3D[self._id_1D3D.size - 1];
        self._id_1D3D[var_0._id_0204]._id_0204 = var_0._id_0204;
    }

    self._id_1D3D[self._id_1D3D.size - 1] = undefined;
    var_0._id_0204 = undefined;
}

_id_7FEE( var_0, var_1, var_2, var_3, var_4 )
{
    if ( !isdefined( var_4 ) )
        var_4 = 0;

    var_5 = _id_407A();

    if ( var_4 )
        self _meth_8088( var_4 );

    if ( !isdefined( var_2 ) )
        var_2 = 0;

    self._id_A39F = var_2;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    self._id_A3BA = var_3;
    self._id_6E19 = var_0;
    self.alignx = "center";
    self.aligny = "middle";

    if ( _func_120( var_0, "TOP" ) )
        self.aligny = "top";

    if ( _func_120( var_0, "BOTTOM" ) )
        self.aligny = "bottom";

    if ( _func_120( var_0, "LEFT" ) )
        self.alignx = "left";

    if ( _func_120( var_0, "RIGHT" ) )
        self.alignx = "right";

    if ( !isdefined( var_1 ) )
        var_1 = var_0;

    self._id_730A = var_1;
    var_6 = "center_adjustable";
    var_7 = "middle";

    if ( _func_120( var_1, "TOP" ) )
        var_7 = "top_adjustable";

    if ( _func_120( var_1, "BOTTOM" ) )
        var_7 = "bottom_adjustable";

    if ( _func_120( var_1, "LEFT" ) )
        var_6 = "left_adjustable";

    if ( _func_120( var_1, "RIGHT" ) )
        var_6 = "right_adjustable";

    if ( var_5 == level._id_99F4 )
    {
        self._id_01F3 = var_6;
        self._id_0501 = var_7;
    }
    else
    {
        self._id_01F3 = var_5._id_01F3;
        self._id_0501 = var_5._id_0501;
    }

    if ( maps\mp\_utility::_id_8F5C( var_6, "_adjustable" ) == var_5.alignx )
    {
        var_8 = 0;
        var_9 = 0;
    }
    else if ( var_6 == "center" || var_5.alignx == "center" )
    {
        var_8 = _func_0BC( var_5._id_0524 / 2 );

        if ( var_6 == "left_adjustable" || var_5.alignx == "right" )
            var_9 = -1;
        else
            var_9 = 1;
    }
    else
    {
        var_8 = var_5._id_0524;

        if ( var_6 == "left_adjustable" )
            var_9 = -1;
        else
            var_9 = 1;
    }

    self._id_0530 = var_5._id_0530 + var_8 * var_9;

    if ( maps\mp\_utility::_id_8F5C( var_7, "_adjustable" ) == var_5.aligny )
    {
        var_10 = 0;
        var_11 = 0;
    }
    else if ( var_7 == "middle" || var_5.aligny == "middle" )
    {
        var_10 = _func_0BC( var_5._id_01E8 / 2 );

        if ( var_7 == "top_adjustable" || var_5.aligny == "bottom" )
            var_11 = -1;
        else
            var_11 = 1;
    }
    else
    {
        var_10 = var_5._id_01E8;

        if ( var_7 == "top_adjustable" )
            var_11 = -1;
        else
            var_11 = 1;
    }

    self._id_0538 = var_5._id_0538 + var_10 * var_11;
    self._id_0530 += self._id_A39F;
    self._id_0538 += self._id_A3BA;

    switch ( self._id_3026 )
    {
        case "bar":
            _id_7FEF( var_0, var_1, var_2, var_3 );
            break;
    }

    _id_9B01();
}

_id_7FEF( var_0, var_1, var_2, var_3 )
{
    self._id_12DB._id_01F3 = self._id_01F3;
    self._id_12DB._id_0501 = self._id_0501;
    self._id_12DB.alignx = "left";
    self._id_12DB.aligny = self.aligny;
    self._id_12DB._id_0538 = self._id_0538;

    if ( self.alignx == "left" )
        self._id_12DB._id_0530 = self._id_0530;
    else if ( self.alignx == "right" )
        self._id_12DB._id_0530 = self._id_0530 - self._id_0524;
    else
        self._id_12DB._id_0530 = self._id_0530 - _func_0BC( self._id_0524 / 2 );

    if ( self.aligny == "top" )
        self._id_12DB._id_0538 = self._id_0538;
    else if ( self.aligny == "bottom" )
        self._id_12DB._id_0538 = self._id_0538;

    _id_9AF7( self._id_12DB._id_3A08 );
}

_id_9AF7( var_0, var_1 )
{
    if ( self._id_3026 == "bar" )
        _id_9AF8( var_0, var_1 );
}

_id_9AF8( var_0, var_1 )
{
    var_2 = _func_0BC( self._id_0524 * var_0 + 0.5 );

    if ( !var_2 )
        var_2 = 1;

    self._id_12DB._id_3A08 = var_0;
    self._id_12DB _meth_80CE( self._id_12DB._id_8392, var_2, self._id_01E8 );

    if ( isdefined( var_1 ) && var_2 < self._id_0524 )
    {
        if ( var_1 > 0 )
            self._id_12DB _meth_8087( ( 1 - var_0 ) / var_1, self._id_0524, self._id_01E8 );
        else if ( var_1 < 0 )
            self._id_12DB _meth_8087( var_0 / -1 * var_1, 1, self._id_01E8 );
    }

    self._id_12DB._id_7143 = var_1;
    self._id_12DB._id_5609 = gettime();
}

_id_2401( var_0, var_1 )
{
    var_2 = _func_1AA( self );
    var_2._id_3026 = "font";
    var_2._id_0188 = var_0;
    var_2._id_0189 = var_1;
    var_2._id_1309 = var_1;
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2._id_0524 = 0;
    var_2._id_01E8 = _func_0BC( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    var_2._id_483E = 0;
    return var_2;
}

_id_243D( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = _func_1AB( var_2 );
    else
        var_3 = _func_1A9();

    var_3._id_3026 = "font";
    var_3._id_0188 = var_0;
    var_3._id_0189 = var_1;
    var_3._id_1309 = var_1;
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_0524 = 0;
    var_3._id_01E8 = _func_0BC( level._id_397D * var_1 );
    var_3._id_A39F = 0;
    var_3._id_A3BA = 0;
    var_3._id_1D3D = [];
    var_3 _id_7FDC( level._id_99F4 );
    var_3._id_483E = 0;
    return var_3;
}

_id_243F( var_0, var_1, var_2 )
{
    if ( isdefined( var_2 ) )
        var_3 = _func_1AB( var_2 );
    else
        var_3 = _func_1A9();

    var_3._id_3026 = "timer";
    var_3._id_0188 = var_0;
    var_3._id_0189 = var_1;
    var_3._id_1309 = var_1;
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_0524 = 0;
    var_3._id_01E8 = _func_0BC( level._id_397D * var_1 );
    var_3._id_A39F = 0;
    var_3._id_A3BA = 0;
    var_3._id_1D3D = [];
    var_3 _id_7FDC( level._id_99F4 );
    var_3._id_483E = 0;
    return var_3;
}

_id_2447( var_0, var_1 )
{
    var_2 = _func_1AA( self );
    var_2._id_3026 = "timer";
    var_2._id_0188 = var_0;
    var_2._id_0189 = var_1;
    var_2._id_1309 = var_1;
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2._id_0524 = 0;
    var_2._id_01E8 = _func_0BC( level._id_397D * var_1 );
    var_2._id_A39F = 0;
    var_2._id_A3BA = 0;
    var_2._id_1D3D = [];
    var_2 _id_7FDC( level._id_99F4 );
    var_2._id_483E = 0;
    return var_2;
}

_id_2420( var_0, var_1, var_2 )
{
    var_3 = _func_1AA( self );
    var_3._id_3026 = "icon";
    var_3._id_0530 = 0;
    var_3._id_0538 = 0;
    var_3._id_0524 = var_1;
    var_3._id_01E8 = var_2;
    var_3._id_1319 = var_3._id_0524;
    var_3._id_130A = var_3._id_01E8;
    var_3._id_A39F = 0;
    var_3._id_A3BA = 0;
    var_3._id_1D3D = [];
    var_3 _id_7FDC( level._id_99F4 );
    var_3._id_483E = 0;

    if ( isdefined( var_0 ) )
    {
        var_3 _meth_80CE( var_0, var_1, var_2 );
        var_3._id_8392 = var_0;
    }

    return var_3;
}

_id_243E( var_0, var_1, var_2, var_3 )
{
    if ( isdefined( var_3 ) )
        var_4 = _func_1AB( var_3 );
    else
        var_4 = _func_1A9();

    var_4._id_3026 = "icon";
    var_4._id_0530 = 0;
    var_4._id_0538 = 0;
    var_4._id_0524 = var_1;
    var_4._id_01E8 = var_2;
    var_4._id_1319 = var_4._id_0524;
    var_4._id_130A = var_4._id_01E8;
    var_4._id_A39F = 0;
    var_4._id_A3BA = 0;
    var_4._id_1D3D = [];
    var_4 _id_7FDC( level._id_99F4 );
    var_4._id_483E = 0;

    if ( isdefined( var_0 ) )
    {
        var_4 _meth_80CE( var_0, var_1, var_2 );
        var_4._id_8392 = var_0;
    }

    return var_4;
}

_id_243C( var_0, var_1, var_2, var_3, var_4, var_5 )
{
    if ( isdefined( var_4 ) )
        var_6 = _func_1AB( var_4 );
    else
        var_6 = _func_1A9();

    var_6._id_0530 = 0;
    var_6._id_0538 = 0;
    var_6._id_3A08 = 0;
    var_6.color = var_0;
    var_6._id_03D4 = -2;
    var_6._id_8392 = "progress_bar_fill";
    var_6 _meth_80CE( "progress_bar_fill", var_1, var_2 );
    var_6._id_483E = 0;

    if ( isdefined( var_3 ) )
        var_6._id_38B2 = var_3;

    if ( isdefined( var_4 ) )
        var_7 = _func_1AB( var_4 );
    else
        var_7 = _func_1A9();

    var_7._id_3026 = "bar";
    var_7._id_0530 = 0;
    var_7._id_0538 = 0;
    var_7._id_0524 = var_1;
    var_7._id_01E8 = var_2;
    var_7._id_A39F = 0;
    var_7._id_A3BA = 0;
    var_7._id_12DB = var_6;
    var_7._id_1D3D = [];
    var_7._id_03D4 = -3;
    var_7.color = ( 0, 0, 0 );
    var_7.alpha = 0.5;
    var_7 _id_7FDC( level._id_99F4 );
    var_7 _meth_80CE( "progress_bar_bg", var_1, var_2 );
    var_7._id_483E = 0;
    return var_7;
}

_id_23E5( var_0, var_1, var_2, var_3 )
{
    var_4 = _func_1AA( self );
    var_4._id_0530 = 0;
    var_4._id_0538 = 0;
    var_4._id_3A08 = 0;
    var_4.color = var_0;
    var_4._id_03D4 = -2;
    var_4._id_8392 = "progress_bar_fill";
    var_4 _meth_80CE( "progress_bar_fill", var_1, var_2 );
    var_4._id_483E = 0;

    if ( isdefined( var_3 ) )
        var_4._id_38B2 = var_3;

    var_5 = _func_1AA( self );
    var_5._id_3026 = "bar";
    var_5._id_0524 = var_1;
    var_5._id_01E8 = var_2;
    var_5._id_A39F = 0;
    var_5._id_A3BA = 0;
    var_5._id_12DB = var_4;
    var_5._id_1D3D = [];
    var_5._id_03D4 = -3;
    var_5.color = ( 0, 0, 0 );
    var_5.alpha = 0.5;
    var_5 _id_7FDC( level._id_99F4 );
    var_5 _meth_80CE( "progress_bar_bg", var_1 + 4, var_2 + 4 );
    var_5._id_483E = 0;
    return var_5;
}

_id_3F46()
{
    var_0 = self._id_12DB._id_3A08;

    if ( isdefined( self._id_12DB._id_7143 ) )
    {
        var_0 += ( gettime() - self._id_12DB._id_5609 ) * self._id_12DB._id_7143 / 1000;

        if ( var_0 > 1 )
            var_0 = 1;

        if ( var_0 < 0 )
            var_0 = 0;
    }

    return var_0;
}

_id_2435( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( self _meth_82CA() )
        var_1 += 20;

    var_2 = _id_23E5( ( 1, 1, 1 ), level._id_6F89, level._id_6F86 );
    var_2 _id_7FEE( "CENTER", undefined, level._id_6F8A + var_0, level._id_6F8B + var_1 );
    return var_2;
}

_id_2436( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        var_0 = 0;

    if ( !isdefined( var_1 ) )
        var_1 = 0;

    if ( self _meth_82CA() )
        var_1 += 20;

    var_2 = _id_2401( "hudbig", level._id_6F85 );
    var_2 _id_7FEE( "CENTER", undefined, level._id_6F87 + var_0, level._id_6F88 + var_1 );
    var_2._id_03D4 = -1;
    return var_2;
}

_id_2444( var_0 )
{
    var_1 = _id_243C( ( 1, 0, 0 ), level._id_91FE, level._id_91FC, undefined, var_0 );
    var_1 _id_7FEE( "TOP", undefined, 0, level._id_91FF );
    return var_1;
}

_id_2445( var_0 )
{
    var_1 = _id_243D( "default", level._id_91FB, var_0 );
    var_1 _id_7FEE( "TOP", undefined, 0, level._id_91FD );
    return var_1;
}

_id_7F72( var_0 )
{
    self._id_12DB._id_38B2 = var_0;
}

_id_4871()
{
    if ( self._id_483E )
        return;

    self._id_483E = 1;

    if ( self.alpha != 0 )
        self.alpha = 0;

    if ( self._id_3026 == "bar" || self._id_3026 == "bar_shader" )
    {
        self._id_12DB._id_483E = 1;

        if ( self._id_12DB.alpha != 0 )
            self._id_12DB.alpha = 0;
    }
}

_id_850A()
{
    if ( !self._id_483E )
        return;

    self._id_483E = 0;

    if ( self._id_3026 == "bar" || self._id_3026 == "bar_shader" )
    {
        if ( self.alpha != 0.5 )
            self.alpha = 0.5;

        self._id_12DB._id_483E = 0;

        if ( self._id_12DB.alpha != 1 )
            self._id_12DB.alpha = 1;
    }
    else if ( self.alpha != 1 )
        self.alpha = 1;
}

_id_38C6()
{
    self endon( "death" );

    if ( !self._id_483E )
        self.alpha = 1;

    for (;;)
    {
        if ( self._id_3A08 >= self._id_38B2 )
        {
            if ( !self._id_483E )
            {
                self _meth_8086( 0.3 );
                self.alpha = 0.2;
                wait 0.35;
                self _meth_8086( 0.3 );
                self.alpha = 1;
            }

            wait 0.7;
            continue;
        }

        if ( !self._id_483E && self.alpha != 1 )
            self.alpha = 1;

        wait 0.05;
    }
}

_id_28E9()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < self._id_1D3D.size; var_1++ )
    {
        if ( isdefined( self._id_1D3D[var_1] ) )
            var_0[var_0.size] = self._id_1D3D[var_1];
    }

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
        var_0[var_1] _id_7FDC( _id_407A() );

    if ( self._id_3026 == "bar" || self._id_3026 == "bar_shader" )
        self._id_12DB _meth_808A();

    self _meth_808A();
}

_id_7F8D( var_0 )
{
    self _meth_80CE( var_0, self._id_0524, self._id_01E8 );
    self._id_8392 = var_0;
}

_id_3FD0( var_0 )
{
    return self._id_8392;
}

_id_7F8E( var_0, var_1 )
{
    self _meth_80CE( self._id_8392, var_0, var_1 );
}

_id_8358( var_0 )
{
    self._id_0524 = var_0;
}

_id_7F89( var_0 )
{
    self._id_01E8 = var_0;
}

_id_800F( var_0, var_1 )
{
    self._id_0524 = var_0;
    self._id_01E8 = var_1;
}

_id_9B01()
{
    for ( var_0 = 0; var_0 < self._id_1D3D.size; var_0++ )
    {
        var_1 = self._id_1D3D[var_0];
        var_1 _id_7FEE( var_1._id_6E19, var_1._id_730A, var_1._id_A39F, var_1._id_A3BA );
    }
}

_id_9718()
{
    self._id_0530 = self._id_A39F;
    self._id_0538 = self._id_A3BA;

    if ( self._id_3026 == "font" )
    {
        self._id_0189 = self._id_1309;
        self._id_0241 = &"";
    }
    else if ( self._id_3026 == "icon" )
        self _meth_80CE( self._id_8392, self._id_0524, self._id_01E8 );

    self.alpha = 0;
}

_id_9721( var_0 )
{
    switch ( self._id_3026 )
    {
        case "timer":
        case "font":
            self._id_0189 = 6.3;
            self _meth_808D( var_0 );
            self._id_0189 = self._id_1309;
            break;
        case "icon":
            self _meth_80CE( self._id_8392, self._id_0524 * 6, self._id_01E8 * 6 );
            self _meth_8087( var_0, self._id_0524, self._id_01E8 );
            break;
    }
}

_id_9717( var_0, var_1 )
{
    var_2 = _func_0BC( var_0 ) * 1000;
    var_3 = _func_0BC( var_1 ) * 1000;

    switch ( self._id_3026 )
    {
        case "timer":
        case "font":
            self _meth_808B( var_2 + 250, var_3 + var_2, var_2 + 250 );
            break;
        default:
            break;
    }
}

_id_971A( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    switch ( var_1 )
    {
        case "left":
            self._id_0530 += 1000;
            break;
        case "right":
            self._id_0530 -= 1000;
            break;
        case "up":
            self._id_0538 -= 1000;
            break;
        case "down":
            self._id_0538 += 1000;
            break;
    }

    self _meth_8088( var_0 );
    self._id_0530 = self._id_A39F;
    self._id_0538 = self._id_A3BA;
}

_id_971B( var_0, var_1 )
{
    if ( !isdefined( var_1 ) )
        var_1 = "left";

    var_2 = self._id_A39F;
    var_3 = self._id_A3BA;

    switch ( var_1 )
    {
        case "left":
            var_2 += 1000;
            break;
        case "right":
            var_2 -= 1000;
            break;
        case "up":
            var_3 -= 1000;
            break;
        case "down":
            var_3 += 1000;
            break;
    }

    self.alpha = 1;
    self _meth_8088( var_0 );
    self._id_0530 = var_2;
    self._id_0538 = var_3;
}

_id_9722( var_0 )
{
    switch ( self._id_3026 )
    {
        case "timer":
        case "font":
            self _meth_808D( var_0 );
            self._id_0189 = 6.3;
        case "icon":
            self _meth_8087( var_0, self._id_0524 * 6, self._id_01E8 * 6 );
            break;
    }
}

_id_9712( var_0 )
{
    self _meth_8086( var_0 );

    if ( isdefined( self._id_5A23 ) )
        self.alpha = self._id_5A23;
    else
        self.alpha = 1;
}

_id_9713( var_0 )
{
    self _meth_8086( 0.15 );
    self.alpha = 0;
}

_id_51D6( var_0 )
{
    if ( _func_120( var_0, "ch_limited" ) )
        return 1;

    return 0;
}

_id_5206( var_0 )
{
    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_kills" ) )
        return 1;

    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_hipfirekills" ) )
        return 1;

    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_headShots" ) )
        return 1;

    return 0;
}

_id_1C4C( var_0 )
{
    if ( _id_5206( var_0 ) )
        return _id_6FFE( var_0 );
    else if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        return self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", "ch_daily" );
    else
        return self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", var_0 );
}

_id_1C4D( var_0 )
{
    if ( _id_5206( var_0 ) )
        return _id_6FFF( var_0 );
    else if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        return self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_daily" );
    else
        return self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "challengeState", var_0 );
}

_id_1C53( var_0, var_1 )
{
    if ( _id_5206( var_0 ) )
        return;

    var_2 = var_1;

    if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", "ch_daily", var_2 );
    else
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "challengeProgress", var_0, var_2 );
}

_id_1C54( var_0, var_1 )
{
    if ( _id_5206( var_0 ) )
        return;

    if ( maps\mp\_utility::_id_51BA( var_0, "ch_daily_" ) )
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "challengeState", "ch_daily", var_1 );
    else
        self _meth_8243( common_scripts\utility::getstatsgroup_ranked(), "challengeState", var_0, var_1 );
}

_id_1C4E( var_0, var_1 )
{
    var_2 = _func_1BB( "mp/allChallengesTable.csv", 0, var_0, 10 + ( var_1 - 1 ) * 2 );

    if ( isdefined( var_2 ) && var_2 != "" )
        return _func_0BC( var_2 );

    return 0;
}

_id_2B5E( var_0, var_1, var_2, var_3 )
{
    var_4 = _id_2401( "hudbig", var_2 );
    var_4 _id_7FEE( "CENTER", "CENTER", 0, var_1 );
    var_4._id_03D4 = 1001;
    var_4.color = ( 1, 1, 1 );
    var_4._id_0198 = 0;
    var_4._id_01ED = 1;
    var_4 _meth_80CC( var_0 );
    common_scripts\utility::_id_A069( var_3, "joined_team", "death" );

    if ( isdefined( var_4 ) )
        var_4 _id_28E9();
}

_id_6FFE( var_0 )
{
    if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_hipfirekills" ) )
        return _id_93F6( var_0, "hipfirekills" );
    else if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_kills" ) )
        return _id_93F6( var_0, "kills" );
    else if ( common_scripts\utility::_id_8F57( var_0, "ch_attach_unlock_headShots" ) )
        return _id_93F6( var_0, "headShots" );
}

_id_6FFF( var_0 )
{
    var_1 = _id_6FFE( var_0 );
    var_2 = 1;

    for ( var_3 = _id_1C4E( var_0, var_2 ); var_3 > 0 && var_1 >= var_3; var_3 = _id_1C4E( var_0, var_2 ) )
        var_2++;

    return var_2;
}

_id_93F6( var_0, var_1 )
{
    var_2 = undefined;
    var_3 = 0;
    var_4 = _func_124( var_0, "_" );

    for ( var_5 = 0; var_5 < var_4.size - 1; var_5++ )
    {
        if ( var_4[var_5] == var_1 )
        {
            var_2 = var_4[var_5 + 1];
            break;
        }
    }

    if ( isdefined( var_2 ) )
    {
        for ( var_6 = _func_1BF( "mp/statstable.csv", 59, var_2 ); var_6 >= 0; var_6 = _func_1BF( "mp/statstable.csv", 59, var_2, var_6 - 1 ) )
        {
            var_7 = _func_1BC( "mp/statstable.csv", var_6, 4 );
            var_3 += self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "weaponStats", var_7, var_1 );
        }

        if ( var_1 == "kills" && isdefined( self._id_94FA ) )
            var_3 += self._id_94FA;

        if ( var_1 == "hipfirekills" && isdefined( self._id_94F8 ) )
            var_3 += self._id_94F8;

        if ( var_1 == "headShots" && isdefined( self._id_94F7 ) )
            var_3 += self._id_94F7;

        var_8 = self _meth_8226( common_scripts\utility::getstatsgroup_ranked(), "attachUnlock_" + var_1, var_2 );

        if ( var_8 > var_3 )
            var_8 = 0;

        return var_3 - var_8;
    }
}

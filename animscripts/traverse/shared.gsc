// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

_id_087F( var_0, var_1 )
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    var_2 = self _meth_81A1();
    self _meth_8193( "face angle", var_2.angles[1] );
    var_2._id_972A = var_2._id_02E2[2] + var_2._id_972B;
    var_3 = var_2._id_972A - var_2._id_02E2[2];
    thread _id_925E( var_3 - var_1 );
    var_4 = 0.15;
    self _meth_8144( %body, var_4 );
    self _meth_8112( "traverse", var_0, %animscript_root, 1, var_4, 1 );
    var_5 = 0.2;
    var_6 = 0.2;
    thread animscripts\notetracks::_id_2D07( "traverse", "no clear" );

    if ( !animhasnotetrack( var_0, "gravity on" ) )
    {
        var_7 = 1.23;
        wait(var_7 - var_5);
        self _meth_8191( "gravity" );
        wait(var_5);
    }
    else
    {
        self waittillmatch( "traverse", "gravity on" );
        self _meth_8191( "gravity" );

        if ( !animhasnotetrack( var_0, "blend" ) )
            wait(var_5);
        else
            self waittillmatch( "traverse", "blend" );
    }
}

_id_925E( var_0 )
{
    self endon( "killanimscript" );
    self notify( "endTeleportThread" );
    self endon( "endTeleportThread" );
    var_1 = 5;
    var_2 = ( 0, 0, var_0 / var_1 );

    for ( var_3 = 0; var_3 < var_1; var_3++ )
    {
        self _meth_81CA( self._id_02E2 + var_2 );
        wait 0.05;
    }
}

_id_925F( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );
    self notify( "endTeleportThread" );
    self endon( "endTeleportThread" );

    if ( var_0 >= 0 || var_2 <= 0 )
        return;

    if ( var_1 > 0 )
        wait(var_1);

    var_4 = ( 0, 0, var_0 / var_2 );

    if ( isdefined( var_3 ) && var_3 < 1.0 )
        self _meth_8111( "traverseAnim", self._id_9735, self._id_9736, 1, 0.2, var_3 );

    for ( var_5 = 0; var_5 < var_2; var_5++ )
    {
        self _meth_81CA( self._id_02E2 + var_4 );
        wait 0.05;
    }

    if ( isdefined( var_3 ) && var_3 < 1.0 )
        self _meth_8111( "traverseAnim", self._id_9735, self._id_9736, 1, 0.2, 1.0 );
}

_id_2D86( var_0 )
{
    self endon( "killanimscript" );
    setdvarifuninitialized( "scr_traverse_debug", 0 );
    self notify( "traverse_started" );
    self._id_51DA = 1;
    self._id_28B4 = "stand";
    animscripts\utility::_id_9AF5();
    var_1 = self _meth_81A1();

    if ( isdefined( var_1._id_972B ) )
        var_1._id_972A = var_1._id_02E2[2] + var_1._id_972B;
    else
        var_1._id_972A = var_1._id_02E2[2];

    var_2 = self _meth_81A2();
    self _meth_8193( "face angle", var_1.angles[1] );
    self._id_973D = var_0["traverseHeight"];
    self._id_973F = var_1;
    var_3 = var_0["traverseAnim"];
    var_4 = var_0["traverseToCoverAnim"];
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    self._id_9740 = self._id_02E2[2];
    var_5 = 0;

    if ( isdefined( var_4 ) && isdefined( self._id_02BB ) && self._id_02BB._id_04D9 == var_0["coverType"] && _func_0F0( self._id_02BB._id_02E2, var_2._id_02E2 ) < 625 )
    {
        if ( animscripts\utility::_id_06C4( self._id_02BB.angles[1] - var_2.angles[1] ) > 160 )
        {
            var_5 = 1;
            var_3 = var_4;
        }
    }

    if ( var_5 )
    {
        if ( isdefined( var_0["traverseToCoverSound"] ) )
            thread _id_A5A4::_id_69C4( var_0["traverseToCoverSound"] );
    }
    else if ( isdefined( var_0["traverseSound"] ) )
        thread _id_A5A4::_id_69C4( var_0["traverseSound"] );

    self._id_9735 = var_3;

    if ( !animhasnotetrack( var_3, "traverse_align" ) )
        _id_4683();

    if ( isdefined( var_0["traverseBodyNode"] ) )
        self._id_9736 = var_0["traverseBodyNode"];
    else
        self._id_9736 = %body;

    self _meth_8112( "traverseAnim", var_3, self._id_9736, 1, 0.2, 1 );
    var_6 = ::_id_4686;

    if ( isdefined( var_0["traverseNotetrackFunc"] ) )
        var_6 = var_0["traverseNotetrackFunc"];

    self._id_973A = 0;
    self._id_9739 = var_0["interruptDeathAnim"];
    animscripts\shared::_id_2D06( "traverseAnim", var_6 );
    self _meth_8191( "gravity" );

    if ( self._id_0112 )
        return;

    self.a._id_612E = 0;

    if ( var_5 && isdefined( self._id_02BB ) && _func_0F0( self._id_02E2, self._id_02BB._id_02E2 ) < 256 )
    {
        self.a._id_5F5B = "stop";
        self _meth_81C9( self._id_02BB._id_02E2 );
    }
    else if ( isdefined( var_0["traverseStopsAtEnd"] ) )
        self.a._id_5F5B = "stop";
    else
    {
        self.a._id_5F5B = "run";
        self _meth_8144( var_3, 0.2 );
    }

    self notify( "traverse_finish" );
    self._id_9736 = undefined;
    self._id_9735 = undefined;
    self._id_2652 = undefined;
    self._id_973F = undefined;
    self._id_51DA = undefined;
}

_id_4686( var_0 )
{
    if ( var_0 == "traverse_death" )
        return _id_4684();
    else if ( var_0 == "traverse_align" )
        return _id_4683();
    else if ( var_0 == "traverse_drop" )
        return _id_4685();
}

_id_4684()
{
    if ( isdefined( self._id_9739 ) )
    {
        var_0 = self._id_9739[self._id_973A];
        self._id_2652 = var_0[_func_0B2( var_0.size )];
        self._id_973A++;
    }
}

_id_4683()
{
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );

    if ( isdefined( self._id_973D ) && isdefined( self._id_973F._id_972A ) )
    {
        var_0 = self._id_973F._id_972A - self._id_9740;
        thread _id_925E( var_0 - self._id_973D );
    }
}

_id_4685()
{
    var_0 = self._id_02E2 + ( 0, 0, 32 );
    var_1 = self _meth_8151( self._id_9735 );
    var_2 = getanimlength( self._id_9735 );
    var_3 = var_1 * var_2;
    var_4 = 0;
    var_5 = 0;
    var_6 = 0;
    var_7 = undefined;
    var_8 = 1.0;
    var_9 = getnotetracktimes( self._id_9735, "land" );

    if ( var_9.size > 0 )
    {
        var_10 = _id_403D( var_1, var_9 );
        var_8 = var_10;
        var_11 = _func_092( self._id_9735, var_1, var_10 );
        var_12 = ( 0, self.angles[1], 0 );
        var_11 = _func_11E( var_11, var_12 );
        var_7 = self._id_02E2 + var_11;
        var_4 = 0 - var_11[2];
        var_11 = ( var_11[0], var_11[1], 0 );
        var_0 += var_11;
        var_5 = ( var_10 - var_1 ) * var_2;
    }
    else
    {
        var_13 = _func_092( self._id_9735, var_1, 1.0 );
        var_12 = ( 0, self.angles[1], 0 );
        var_13 = _func_11E( var_13, var_12 );
        var_4 = 0 - var_13[2];
        var_7 = self._id_02E2 + var_13;
        var_14 = var_2 - var_3;
        var_5 = var_14 / 3.0;
    }

    var_15 = _func_08F( var_0, var_0 + ( 0, 0, -768 ) );
    var_16 = _func_0EE( var_0, var_15 );
    var_17 = var_16 - 32 - 0.5;
    var_18 = var_4 - var_17;

    if ( var_4 < var_17 )
        var_19 = var_4 / var_17;
    else
        var_19 = 1;

    var_6 = _func_0E3( var_5 * 20 );
    thread _id_925F( var_18, 0, var_6, var_19 );
    thread _id_379C( var_15[2], var_5, var_9.size, var_18 );
}

_id_403D( var_0, var_1 )
{
    for ( var_2 = 0; var_2 < var_1.size - 1; var_2++ )
    {
        for ( var_3 = var_2 + 1; var_3 < var_1.size; var_3++ )
        {
            if ( var_1[var_3] < var_1[var_2] )
            {
                var_4 = var_1[var_3];
                var_1[var_3] = var_1[var_2];
                var_1[var_2] = var_4;
            }
        }
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        if ( var_1[var_2] > var_0 )
            return var_1[var_2];
    }

    return var_1[var_1.size - 1];
}

_id_379C( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );

    if ( var_2 > 0 )
    {
        var_4 = var_1;

        if ( var_3 > 0 )
            var_4 -= 0.1;

        if ( var_4 < 0 )
            var_4 = 0.0;

        wait(var_4);
        self _meth_8191( "gravity" );
    }
    else
    {
        var_0 += 4.0;

        for (;;)
        {
            if ( self._id_02E2[2] < var_0 )
            {
                self _meth_8191( "gravity" );
                break;
            }

            wait 0.05;
        }
    }
}

_id_2D15()
{
    self _meth_8192( "zonly_physics" );
    self waittill( "killanimscript" );
}

_id_2D8D( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self endon( "killanimscript" );
    var_7 = 1;

    if ( isdefined( self._id_5F65 ) )
        var_7 = self._id_5F65;

    var_8 = self _meth_81A1();
    var_9 = self._id_02E2;

    if ( isdefined( var_0 ) )
    {
        var_10 = _func_092( var_0, 0, 1 );
        var_9 = _id_96EF( var_10, var_8._id_02E2, var_8.angles );
    }

    var_11 = self _meth_81A2();
    var_12 = var_11._id_02E2;

    if ( isdefined( var_2 ) )
    {
        var_13 = _func_092( var_2, 0, 1 );
        var_12 = _id_96EF( var_13 * -1, var_11._id_02E2, var_11.angles );
        var_12 += ( 0, 0, 1 );
    }

    var_14 = _func_092( var_1, 0, 1 );
    var_15 = _func_0F1( var_14 ) * var_7 / getanimlength( var_1 );
    var_16 = _func_0F1( var_12 - var_9 ) / var_15;

    if ( var_16 <= 0 )
        return;

    self._id_51DA = 1;
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();

    if ( isdefined( var_3 ) )
        self _meth_8191( var_3 );
    else
        self _meth_8191( "noclip" );

    self.allowpain = 1;

    if ( isdefined( var_6 ) )
        var_17 = var_6;
    else
        var_17 = %body;

    self _meth_8193( "face angle", var_8.angles[1] );

    if ( isdefined( var_0 ) )
    {
        self _meth_8112( "traversal", var_0, var_17, 1, 0.1, var_7 );
        animscripts\shared::_id_2D06( "traversal" );
    }

    self _meth_8112( "traversal", var_1, var_17, 1, 0.1, var_7 );
    animscripts\notetracks::_id_2D0B( var_16, "traversal" );

    if ( isdefined( var_2 ) )
    {
        self _meth_8112( "traversal", var_2, var_17, 1, 0.1, var_7 );
        animscripts\shared::_id_2D06( "traversal" );
    }

    self _meth_8191( "gravity" );

    if ( isdefined( var_4 ) )
        self.a._id_6E5A = var_4;

    if ( isdefined( var_5 ) )
        self.a._id_5F5B = var_5;

    self._id_51DA = undefined;
}

_id_96EF( var_0, var_1, var_2 )
{
    var_3 = _func_0F1( var_0 );
    var_4 = _func_115( var_0 );
    var_5 = _func_11C( var_2, var_4 );
    var_6 = anglestoforward( var_5 );
    return var_1 + var_6 * var_3;
}

_id_2CA3( var_0 )
{
    var_1 = undefined;
    var_2 = 0;
    var_3 = 0;

    if ( var_0 == "traverse_jump_start" )
    {
        var_2 = 1;
        var_4 = getnotetracktimes( self._id_9735, "traverse_align" );

        if ( var_4.size > 0 )
            var_1 = var_4;
        else
        {
            var_1 = getnotetracktimes( self._id_9735, "traverse_jump_end" );
            var_3 = 1;
        }
    }
    else if ( var_0 == "gravity on" )
    {
        var_2 = 1;
        var_1 = getnotetracktimes( self._id_9735, "traverse_jump_end" );
        var_3 = 1;
    }

    if ( var_2 )
    {
        var_5 = getnotetracktimes( self._id_9735, var_0 );
        var_6 = var_5[0];
        var_7 = _func_092( self._id_9735, 0, var_5[0] );
        var_8 = var_7[2];
        var_7 = _func_092( self._id_9735, 0, var_1[0] );
        var_9 = var_7[2];
        var_10 = var_1[0];
        var_11 = getanimlength( self._id_9735 );
        var_12 = _func_0BC( ( var_10 - var_6 ) * var_11 * 30 );
        var_13 = _func_0E1( 1, var_12 - 2 );
        var_14 = var_9 - var_8;

        if ( var_3 )
        {
            var_7 = _func_092( self._id_9735, 0, 1 );
            var_15 = var_7[2] - var_9;
            var_16 = self._id_973B._id_02E2[2] - self._id_02E2[2] - var_15;
        }
        else
        {
            var_17 = self._id_973F;
            var_16 = var_17._id_972B - ( self._id_02E2[2] - var_17._id_02E2[2] );
        }

        thread _id_925F( var_16 - var_14, 0, var_13 );
        return 1;
    }
}

_id_2CB9()
{
    self waittill( "killanimscript" );
    self._id_973F = undefined;
    self._id_973B = undefined;
}
#using_animtree("dog");

_id_2CBD( var_0, var_1, var_2 )
{
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_3 = self _meth_81A1();
    self _meth_8193( "face angle", var_3.angles[1] );

    if ( !isdefined( var_2 ) )
    {
        var_4 = var_3._id_972A - var_3._id_02E2[2];
        thread _id_925E( var_4 - var_1 );
    }

    self._id_9735 = anim._id_2CE0[var_0];
    self._id_973F = var_3;
    self._id_973B = self _meth_81A2();
    self _meth_8144( %body, 0.2 );
    self _meth_8115( "dog_traverse", self._id_9735, 1, 0.2, 1 );
    self._id_5F44 = "land";
    animscripts\notetracks::_id_2D10( "dog_traverse", ::_id_2CA3 );
    self._id_5F44 = undefined;
    self._id_9735 = undefined;
}

_id_2CA8( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_4 = self _meth_81A1();
    var_5 = self _meth_81A2();
    self _meth_8193( "face angle", var_4.angles[1] );

    if ( !isdefined( var_2 ) )
        var_2 = "jump_down_40";

    self._id_9735 = anim._id_2CE0[var_2];
    self._id_9736 = %body;
    self._id_973F = var_4;
    self._id_973B = var_5;

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !var_3 )
    {
        var_6 = var_4._id_02E2[2] - var_5._id_02E2[2];
        thread _id_925F( 40.0 - var_6, 0.1, var_0, var_1 );
    }

    self._id_5F44 = "land";
    self _meth_8144( %body, 0.2 );
    self _meth_8115( "traverseAnim", self._id_9735, 1, 0.2, 1 );

    if ( !var_3 )
        animscripts\shared::_id_2D06( "traverseAnim" );
    else
        animscripts\notetracks::_id_2D10( "traverseAnim", ::_id_2CA3 );

    self._id_5F44 = undefined;
    self _meth_8191( "gravity" );
    self._id_9736 = undefined;
    self._id_9735 = undefined;
}

_id_2CA9( var_0, var_1, var_2, var_3 )
{
    self endon( "killanimscript" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_4 = self _meth_81A1();
    self _meth_8193( "face angle", var_4.angles[1] );

    if ( !isdefined( var_2 ) )
        var_2 = "jump_up_40";

    self._id_9735 = anim._id_2CE0[var_2];
    self._id_9736 = %body;
    self._id_973F = var_4;
    self._id_973B = self _meth_81A2();

    if ( !isdefined( var_3 ) )
        var_3 = 0;

    if ( !var_3 )
        thread _id_925F( var_0 - 40.0, 0.2, var_1 );

    self._id_5F44 = "land";
    self _meth_8144( %body, 0.2 );
    self _meth_8115( "traverseAnim", self._id_9735, 1, 0.2, 1 );

    if ( !var_3 )
        animscripts\shared::_id_2D06( "traverseAnim" );
    else
        animscripts\notetracks::_id_2D10( "traverseAnim", ::_id_2CA3 );

    self._id_5F44 = undefined;
    self _meth_8191( "gravity" );
    self._id_9735 = undefined;
    self._id_9736 = undefined;
}

_id_2CAB( var_0, var_1 )
{
    self endon( "killanimscript" );
    self _meth_8191( "nogravity" );
    self _meth_8191( "noclip" );
    thread _id_2CB9();
    var_2 = self _meth_81A1();
    self _meth_8193( "face angle", var_2.angles[1] );

    if ( !isdefined( var_2._id_972A ) )
        var_2._id_972A = var_2._id_02E2[2];

    var_3 = var_2._id_972A - var_2._id_02E2[2];
    thread _id_925E( var_3 - var_1 );
    self._id_5F44 = "land";
    self _meth_8144( %body, 0.2 );
    self _meth_8112( "dog_traverse", anim._id_2CE0[var_0], 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "dog_traverse" );
    self._id_5F44 = undefined;
}

_id_403B()
{
    var_0 = ( 0, 0, 0 );
    var_1 = ( 0, 0, 0 );

    if ( isdefined( self._id_5A7A ) && self._id_5A7A )
    {
        var_1 = self _meth_8184( "j2_ball_ri" );
        var_0 = self _meth_8184( "j2_ball_le" );
    }
    else
    {
        var_1 = self _meth_8184( "j_ball_ri" );
        var_0 = self _meth_8184( "j_ball_le" );
    }

    if ( !isdefined( var_1 ) || !isdefined( var_0 ) )
        return "none";

    if ( var_0[2] > var_1[2] )
        return "Left";

    return "Right";
}

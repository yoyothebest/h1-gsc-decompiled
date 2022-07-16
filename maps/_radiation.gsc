// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    precachestring( &"SCOUTSNIPER_MRHR" );
    precachestring( &"SCRIPT_RADIATION_DEATH" );
    precacheshellshock( "radiation_low" );
    precacheshellshock( "radiation_med" );
    precacheshellshock( "radiation_high" );

    foreach ( var_2, var_1 in level._id_0323 )
    {
        var_1.radiation = spawnstruct();
        var_1.radiation.super_dose = 0;
        var_1.radiation.inside = 0;
        var_1 _id_A5A4::_id_32DD( "_radiation_poisoning" );
    }

    common_scripts\utility::_id_76BB( "radiation", ::updateradiationtriggers );
    common_scripts\utility::_id_76BB( "super_radiation", ::super_radiation_trigger );
    common_scripts\utility::_id_0D13( level._id_0323, ::updateradiationdosage );
    common_scripts\utility::_id_0D13( level._id_0323, ::updateradiationdosimeter );
    common_scripts\utility::_id_0D13( level._id_0323, ::updateradiationshock );
    common_scripts\utility::_id_0D13( level._id_0323, ::updateradiationblackout );
    common_scripts\utility::_id_0D13( level._id_0323, ::updateradiationsound );
    common_scripts\utility::_id_0D13( level._id_0323, ::updateradiationflag );
    common_scripts\utility::_id_0D13( level._id_0323, ::first_radiation_dialogue );
}

updateradiationtriggers()
{
    self._id_5BA6 = 0;

    for (;;)
    {
        self waittill( "trigger", var_0 );
        thread updateradiationtrigger_perplayer( var_0 );
    }
}

updateradiationtrigger_perplayer( var_0 )
{
    if ( var_0.radiation.inside )
        return;

    var_0.radiation.inside = 1;
    var_0.radiation.triggers[var_0.radiation.triggers.size] = self;

    while ( var_0 _meth_80AB( self ) )
        wait 0.05;

    var_0.radiation.inside = 0;
    var_0.radiation.triggers = common_scripts\utility::_id_0CF6( var_0.radiation.triggers, self );
}

super_radiation_trigger()
{
    self waittill( "trigger", var_0 );
    var_0.radiation.super_dose = 1;
}

updateradiationdosage()
{
    self.radiation.triggers = [];
    self.radiation._id_0355 = 0;
    self.radiation.ratepercent = 0;
    self.radiation._id_93F3 = 0;
    self.radiation.totalpercent = 0;
    var_0 = 1;
    var_1 = 0;
    var_2 = 1100000 / 60 * var_0;
    var_3 = 200000;
    var_4 = var_2 - var_1;

    for (;;)
    {
        var_5 = [];

        for ( var_6 = 0; var_6 < self.radiation.triggers.size; var_6++ )
        {
            var_7 = self.radiation.triggers[var_6];
            var_8 = _func_0EE( self._id_02E2, var_7._id_02E2 ) - 15;
            var_5[var_6] = var_2 - var_2 / var_7._id_0351 * var_8;
        }

        var_9 = 0;

        for ( var_6 = 0; var_6 < var_5.size; var_6++ )
            var_9 += var_5[var_6];

        if ( var_9 < var_1 )
            var_9 = var_1;

        if ( var_9 > var_2 )
            var_9 = var_2;

        self.radiation._id_0355 = var_9;
        self.radiation.ratepercent = ( var_9 - var_1 ) / var_4 * 100;

        if ( self.radiation.super_dose )
        {
            var_9 = var_2;
            self.radiation.ratepercent = 100;
        }

        if ( self.radiation.ratepercent > 25 )
        {
            self.radiation._id_93F3 += var_9;
            self.radiation.totalpercent = self.radiation._id_93F3 / var_3 * 100;
        }
        else if ( self.radiation.ratepercent < 1 && self.radiation._id_93F3 > 0 )
        {
            self.radiation._id_93F3 -= 1500;

            if ( self.radiation._id_93F3 < 0 )
                self.radiation._id_93F3 = 0;

            self.radiation.totalpercent = self.radiation._id_93F3 / var_3 * 100;
        }

        wait(var_0);
    }
}

updateradiationshock()
{
    var_0 = 1;

    for (;;)
    {
        if ( self.radiation.ratepercent >= 75 )
        {
            self _meth_8186( "radiation_high", 5 );
            _id_A5E8::_id_870C( "aud_radiation_shellshock", "radiation_high" );
        }
        else if ( self.radiation.ratepercent >= 50 )
        {
            self _meth_8186( "radiation_med", 5 );
            _id_A5E8::_id_870C( "aud_radiation_shellshock", "radiation_med" );
        }
        else if ( self.radiation.ratepercent > 25 )
        {
            self _meth_8186( "radiation_low", 5 );
            _id_A5E8::_id_870C( "aud_radiation_shellshock", "radiation_low" );
        }
        else if ( self.radiation.ratepercent <= 25 && self.radiation.ratepercent > 0 )
            _id_A5E8::_id_870C( "aud_radiation_shellshock", "radiation_none" );

        wait(var_0);
    }
}

updateradiationsound()
{
    thread playradiationsound();

    for (;;)
    {
        if ( self.radiation.ratepercent >= 75 )
            self.radiation._id_8899 = "item_geigercouner_level4";
        else if ( self.radiation.ratepercent >= 50 )
            self.radiation._id_8899 = "item_geigercouner_level3";
        else if ( self.radiation.ratepercent >= 25 )
            self.radiation._id_8899 = "item_geigercouner_level2";
        else if ( self.radiation.ratepercent > 0 )
            self.radiation._id_8899 = "item_geigercouner_level1";
        else
            self.radiation._id_8899 = "none";

        wait 0.05;
    }
}

updateradiationflag()
{
    for (;;)
    {
        if ( self.radiation.ratepercent > 25 )
            _id_A5A4::_id_32DE( "_radiation_poisoning" );
        else
            _id_A5A4::_id_32DA( "_radiation_poisoning" );

        wait 0.05;
    }
}

playradiationsound()
{
    wait 0.05;
    var_0 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_0._id_02E2 = self._id_02E2;
    var_0.angles = self.angles;
    var_0 _meth_804F( self );
    var_1 = self.radiation._id_8899;

    for (;;)
    {
        if ( var_1 != self.radiation._id_8899 )
        {
            var_0 _meth_80AD();

            if ( isdefined( self.radiation._id_8899 ) && self.radiation._id_8899 != "none" )
                var_0 _meth_8077( self.radiation._id_8899 );
        }

        var_1 = self.radiation._id_8899;
        wait 0.05;
    }
}

updateradiationratepercent()
{
    var_0 = 0.05;
    var_1 = _func_1AA( self );
    var_1._id_0189 = 1.2;
    var_1._id_0530 = 670;
    var_1._id_0538 = 350;
    var_1.alignx = "right";
    var_1._id_0241 = "";
    var_1.alpha = 0;

    for (;;)
    {
        var_1._id_0241 = self.radiation.ratepercent;
        wait(var_0);
    }
}

updateradiationdosimeter()
{
    var_0 = 0.028;
    var_1 = 100;
    var_2 = 1;
    var_3 = var_1 - var_0;
    var_4 = self._id_02E2;
    var_5 = _func_1AA( self );
    var_5._id_0189 = 1.2;
    var_5._id_0530 = 676;
    var_5._id_0538 = 360;
    var_5.alpha = 0;
    var_5.alignx = "right";
    var_5._id_0241 = &"SCOUTSNIPER_MRHR";
    var_5 thread updateradiationdosimetercolor( self );

    for (;;)
    {
        if ( self.radiation._id_0355 <= var_0 )
        {
            var_6 = _func_0B5( -0.001, 0.001 );
            var_5 _meth_80D9( var_0 + var_6 );
        }
        else if ( self.radiation._id_0355 > var_1 )
            var_5 _meth_80D9( var_1 );
        else
            var_5 _meth_80D9( self.radiation._id_0355 );

        wait(var_2);
    }
}

updateradiationdosimetercolor( var_0 )
{
    var_1 = 0.05;

    for (;;)
    {
        var_2 = 1;
        var_3 = 0.13;

        while ( var_0.radiation._id_0355 >= 100 )
        {
            if ( var_2 <= 0 || var_2 >= 1 )
                var_3 *= -1;

            var_2 += var_3;

            if ( var_2 <= 0 )
                var_2 = 0;

            if ( var_2 >= 1 )
                var_2 = 1;

            self.color = ( 1, var_2, var_2 );
            wait(var_1);
        }

        self.color = ( 1, 1, 1 );
        wait(var_1);
    }
}

updateradiationblackout()
{
    level endon( "special_op_terminated" );
    self endon( "death" );
    var_0 = _func_1AA( self );
    var_0._id_0530 = 0;
    var_0._id_0538 = 0;
    var_0 _meth_80CE( "black", 640, 480 );
    var_0.alignx = "left";
    var_0.aligny = "top";
    var_0._id_01F3 = "fullscreen";
    var_0._id_0501 = "fullscreen";
    var_0.alpha = 0;
    var_1 = 1;
    var_2 = 4;
    var_3 = 0.25;
    var_4 = 1;
    var_5 = 25;
    var_6 = 100;
    var_7 = 0;

    for (;;)
    {
        while ( self.radiation.totalpercent > 25 && self.radiation.ratepercent > 25 )
        {
            var_8 = var_6 - var_5;
            var_7 = ( self.radiation.totalpercent - var_5 ) / var_8;

            if ( var_7 < 0 )
                var_7 = 0;
            else if ( var_7 > 1 )
                var_7 = 1;

            var_9 = var_2 - var_1;
            var_10 = var_1 + var_9 * ( 1 - var_7 );
            var_11 = var_4 - var_3;
            var_12 = var_3 + var_11 * var_7;
            var_13 = 7.2 * var_12;
            var_14 = var_7 * 0.5;
            var_15 = 7.2 * var_14;

            if ( var_7 == 1 )
                break;

            var_16 = var_10 / 2;
            var_0 _id_35F1( var_16, var_12, var_13, self );
            var_0 _id_35F6( var_16, var_14, var_15, self );
            wait(var_7 * 0.5);
        }

        if ( var_7 == 1 )
            break;

        if ( var_0.alpha != 0 )
            var_0 _id_35F6( 1, 0, 0, self );

        wait 0.05;
    }

    var_0 _id_35F1( 2, 1, 6, self );
    thread radiation_kill();
}

radiation_kill()
{
    self._id_8A2A = 1;
    self._id_8A2B = 1;
    self.radiationdeath = 1;

    if ( !_id_A5A4::_id_5346() )
        return;

    waitframe;
    var_0 = &"SCRIPT_RADIATION_DEATH";
    setdvar( "ui_deadquote", var_0 );
}

_id_35F1( var_0, var_1, var_2, var_3 )
{
    self _meth_8086( var_0 );
    self.alpha = var_1;
    var_3 _meth_82D6( var_2, var_0 );
    wait(var_0);
}

_id_35F6( var_0, var_1, var_2, var_3 )
{
    self _meth_8086( var_0 );
    self.alpha = var_1;
    var_3 _meth_82D6( var_2, var_0 );
    wait(var_0);
}

first_radiation_dialogue()
{
    self endon( "death" );

    for (;;)
    {
        _id_A5A4::_id_32E0( "_radiation_poisoning" );

        if ( level._id_038E == "scoutsniper" || level._id_038E == "co_scoutsniper" )
            level thread _id_A5A4::_id_3AF2( _id_A5A4::_id_70BD, "scoutsniper_mcm_youdaft" );

        level notify( "radiation_warning" );
        _id_A5A4::_id_32E4( "_radiation_poisoning" );
        wait 10;
    }
}

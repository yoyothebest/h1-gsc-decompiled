// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "mi28", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_mi-28_flying" );
    _id_A5A8::_id_1849( %mi28_rotors, undefined, 0, 3.0 );
    _id_A5A8::_id_1842( "fx/fire/fire_smoke_trail_L", "main_rotor_jnt", "havoc_helicopter_dying_loop", 1, 0.05, 1, 0.5, 1, undefined );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_185A();
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_1857( var_2, "wingtip_green", "tag_light_L_wing", "fx/misc/aircraft_light_wingtip_green", "running", 0.1 );
    _id_A5A8::_id_1857( var_2, "wingtip_red", "tag_light_R_wing", "fx/misc/aircraft_light_wingtip_red", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink", "tag_light_belly", "fx/misc/aircraft_light_white_blink", "running", 0.0 );
    _id_A5A8::_id_1857( var_2, "white_blink_tail", "tag_light_tail", "fx/misc/aircraft_light_red_blink", "running", 0.4 );
    _id_A5A8::_id_1855();
}

_id_4D10()
{
    self._id_7957 = 0;
    self.script_light_toggle = 1;
    _id_A5A8::_id_9D02( "running" );
    thread _id_4521();
}

_id_7EFA( var_0 )
{
    return var_0;
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 12000;
    vehicle_scripts\_mi28_aud::snd_init_mi28();
    thread _id_5D80();
    self._id_86CE = self._id_799F;

    for (;;)
    {
        if ( !isdefined( self._id_86CE ) || !self._id_86CE )
        {
            var_2 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

            if ( var_0 && var_2 > var_1 )
            {
                vehicle_scripts\_mi28_aud::snd_stop_mi28( 1.0 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_2 < var_1 )
            {
                vehicle_scripts\_mi28_aud::snd_start_mi28();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_mi28_aud::snd_stop_mi28( 1.0 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    vehicle_scripts\_mi28_aud::snd_stop_mi28( 1.0 );
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 2; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_pilot";
    var_0[1]._id_85AE = "tag_gunner";
    var_0[0]._id_4B63[0] = %helicopter_pilot1_idle;
    var_0[0]._id_4B63[1] = %helicopter_pilot1_twitch_clickpannel;
    var_0[0]._id_4B63[2] = %helicopter_pilot1_twitch_lookback;
    var_0[0]._id_4B63[3] = %helicopter_pilot1_twitch_lookoutside;
    var_0[0]._id_4B7E[0] = 500;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_4B7E[2] = 100;
    var_0[0]._id_4B7E[3] = 100;
    var_0[1]._id_4B63[0] = %helicopter_pilot2_idle;
    var_0[1]._id_4B63[1] = %helicopter_pilot2_twitch_clickpannel;
    var_0[1]._id_4B63[2] = %helicopter_pilot2_twitch_lookoutside;
    var_0[1]._id_4B63[3] = %helicopter_pilot2_twitch_radio;
    var_0[1]._id_4B7E[0] = 450;
    var_0[1]._id_4B7E[1] = 100;
    var_0[1]._id_4B7E[2] = 100;
    var_0[1]._id_4B7E[3] = 100;
    var_0[0]._id_1433 = 0;
    var_0[1]._id_1433 = 0;
    return var_0;
}

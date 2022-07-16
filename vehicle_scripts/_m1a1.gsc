// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "m1a1", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_m1a1_abrams", "vehicle_m1a1_abrams_dmg" );
    _id_A5A8::_id_1868( "tankblast" );
    _id_A5A8::_id_1849( %abrams_movement, %abrams_movement_backwards, 10 );
    _id_A5A8::_id_184B( "fx/distortion/abrams_exhaust" );
    _id_A5A8::_id_1847( "fx/dust/abrams_deck_dust" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1842( "fx/explosions/large_vehicle_explosion", undefined, "exp_armor_vehicle" );
    _id_A5A8::_id_1872( "m1a1_coaxial_mg", "tag_coax_mg", "vehicle_m1a1_abrams_PKT_Coaxial_MG" );
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_1865( "tank_rumble", 0.15, 4.5, 900, 1, 1 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_185A();
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_184C( 0.33 );
}

_id_4D10()
{
    if ( !isdefined( level._id_0E57.disable_m1a1_audio ) )
        _id_4521();
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 6000;
    var_2 = 1.0;
    vehicle_scripts\_m1a1_aud::snd_init_m1a1();
    thread _id_5D80();
    self._id_86CE = self._id_799F;

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_3 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

            if ( var_0 && var_3 > var_1 )
            {
                vehicle_scripts\_m1a1_aud::snd_stop_m1a1( var_2 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_3 < var_1 )
            {
                vehicle_scripts\_m1a1_aud::snd_start_m1a1();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_m1a1_aud::snd_stop_m1a1( var_2 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    var_0 = 1.0;
    vehicle_scripts\_m1a1_aud::snd_stop_m1a1( var_0 );
}

_id_7EFA( var_0 )
{
    return var_0;
}

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 11; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_406A = 1;
    return var_0;
}

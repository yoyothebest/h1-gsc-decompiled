// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "technical", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_pickup_technical", "vehicle_pickup_technical_destroyed", 3 );
    _id_A5A8::_id_1872( "50cal_turret_technical", "tag_50cal", "weapon_pickup_technical_mg50cal", undefined, undefined, 2.9 );
    _id_A5A8::_id_1849( %technical_driving_idle_forward, %technical_driving_idle_backward, 10 );
    _id_A5A8::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_tank", "smallfire", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1842( "fx/explosions/ammo_cookoff", "tag_fx_bed", undefined, undefined, undefined, undefined, 0.5 );
    _id_A5A8::_id_1842( "fx/explosions/Vehicle_Explosion_Pickuptruck", "tag_deathfx", "car_explode", undefined, undefined, undefined, 2.9 );
    _id_A5A8::_id_1842( "fx/fire/firelp_small_pm_a", "tag_fx_tire_right_r", "smallfire", undefined, undefined, 1, 3 );
    _id_A5A8::_id_1842( "fx/fire/firelp_med_pm", "tag_fx_cab", "fire_metal_medium", undefined, undefined, 1, 3.01 );
    _id_A5A8::_id_1842( "fx/fire/firelp_small_pm_a", "tag_engine_left", "smallfire", undefined, undefined, 1, 3.01 );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_1839( ::_id_7F23, ::_id_7EFA );
    _id_A5A8::_id_1873( ::_id_9A3D );
    _id_A5A8::_id_1857( var_2, "headlight_truck_left", "tag_headlight_left", "fx/misc/car_headlight_truck_L", "headlights" );
    _id_A5A8::_id_1857( var_2, "headlight_truck_right", "tag_headlight_right", "fx/misc/car_headlight_truck_R", "headlights" );
    _id_A5A8::_id_1857( var_2, "parkinglight_truck_left_f", "tag_parkinglight_left_f", "fx/misc/car_parkinglight_truck_LF", "headlights" );
    _id_A5A8::_id_1857( var_2, "parkinglight_truck_right_f", "tag_parkinglight_right_f", "fx/misc/car_parkinglight_truck_RF", "headlights" );
    _id_A5A8::_id_1857( var_2, "taillight_truck_right", "tag_taillight_right", "fx/misc/car_taillight_truck_R", "headlights" );
    _id_A5A8::_id_1857( var_2, "taillight_truck_left", "tag_taillight_left", "fx/misc/car_taillight_truck_L", "headlights" );
    _id_A5A8::_id_1857( var_2, "brakelight_truck_right", "tag_taillight_right", "fx/misc/car_brakelight_truck_R", "brakelights" );
    _id_A5A8::_id_1857( var_2, "brakelight_truck_left", "tag_taillight_left", "fx/misc/car_brakelight_truck_L", "brakelights" );
    _id_A5A8::_id_183F( 0.5, 3, 512, 700, "axis", "allies" );
    _id_A5A8::_id_1840( 2.9 );
    _id_A5A8::_id_1862( ( 0, 0, 53 ), 512, 300, 20, 1, 2.9 );
}

_id_7EFA( var_0 )
{
    return var_0;
}

_id_4D10()
{
    _id_4521();
}

_id_4521()
{
    self endon( "death" );
    var_0 = 0;
    var_1 = 6000;
    var_2 = 1.0;
    vehicle_scripts\_technical_aud::snd_init_technical();
    thread _id_5D80();

    for (;;)
    {
        if ( !isdefined( self._id_799F ) || !self._id_799F )
        {
            var_3 = _func_0EE( self._id_02E2, level._id_0318._id_02E2 );

            if ( var_0 && var_3 > var_1 )
            {
                vehicle_scripts\_technical_aud::snd_stop_technical( var_2 );
                var_0 = 0;
                wait 0.1;
            }
            else if ( !var_0 && var_3 < var_1 )
            {
                vehicle_scripts\_technical_aud::snd_start_technical();
                var_0 = 1;
            }
        }
        else if ( var_0 )
        {
            vehicle_scripts\_technical_aud::snd_stop_technical( var_2 );
            var_0 = 0;
        }

        wait 0.1;
    }
}

_id_5D80()
{
    self waittill( "death" );
    var_0 = 1.0;
    vehicle_scripts\_technical_aud::snd_stop_technical( var_0 );
}
#using_animtree("generic_human");

_id_7F23()
{
    var_0 = [];

    for ( var_1 = 0; var_1 < 3; var_1++ )
        var_0[var_1] = spawnstruct();

    var_0[0]._id_85AE = "tag_driver";
    var_0[1]._id_85AE = "tag_gunner";
    var_0[2]._id_85AE = "tag_passenger";
    var_0[0]._id_4B63[0] = %technical_driver_idle;
    var_0[0]._id_4B63[1] = %technical_driver_duck;
    var_0[0]._id_4B7E[0] = 1000;
    var_0[0]._id_4B7E[1] = 100;
    var_0[0]._id_0108 = %technical_driver_fallout;
    var_0[2]._id_0108 = %technical_passenger_fallout;
    var_0[0]._id_9A43 = 0.9;
    var_0[1]._id_9A43 = 0.9;
    var_0[2]._id_9A43 = 0.9;
    var_0[2]._id_4B63[0] = %technical_passenger_idle;
    var_0[2]._id_4B63[1] = %technical_passenger_duck;
    var_0[2]._id_4B7E[0] = 1000;
    var_0[2]._id_4B7E[1] = 100;
    var_0[0]._id_4068 = %technical_driver_climb_out;
    var_0[2]._id_4068 = %technical_passenger_climb_out;
    var_0[1]._id_5BD5 = 0;
    return var_0;
}

_id_9A3D()
{
    var_0 = [];
    var_0["passengers"] = [];
    var_0["passenger_and_gunner"] = [];
    var_0["all"] = [];
    var_1 = "passenger_and_gunner";
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_1 = "all";
    var_0[var_1][var_0[var_1].size] = 0;
    var_0[var_1][var_0[var_1].size] = 1;
    var_0[var_1][var_0[var_1].size] = 2;
    var_1 = "passengers";
    var_0[var_1][var_0[var_1].size] = 2;
    var_0["default"] = var_0["all"];
    return var_0;
}

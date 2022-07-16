// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("vehicles");

main( var_0, var_1, var_2 )
{
    _id_A5A8::_id_186C( "t72", var_0, var_1, var_2 );
    _id_A5A8::_id_1859( ::_id_4D10 );
    _id_A5A8::_id_1845( "vehicle_t72_tank", "vehicle_t72_tank_d_body", 0.5 );
    _id_A5A8::_id_1845( "vehicle_t72_tank_low", "vehicle_t72_tank_d_body", 0.5 );
    _id_A5A8::_id_1845( "vehicle_t72_tank_woodland", "vehicle_t72_tank_d_woodland_body", 0 );
    _id_A5A8::_id_1868( "tankblast" );
    _id_A5A8::_id_1849( %abrams_movement, %abrams_movement_backwards, 10 );
    _id_A5A8::_id_1842( "fx/explosions/vehicle_explosion_t72", "tag_deathfx", "exp_armor_vehicle", undefined, undefined, undefined, 0 );
    _id_A5A8::_id_1842( "fx/fire/firelp_large_pm", "tag_deathfx", "fire_metal_medium", undefined, undefined, 1, 0 );
    _id_A5A8::_id_1872( "t72_turret2", "tag_turret2", "vehicle_t72_tank_pkt_coaxial_mg" );
    _id_A5A8::_id_186E();
    _id_A5A8::_id_1856( 999, 500, 1500 );
    _id_A5A8::_id_1865( "tank_rumble", 0.15, 4.5, 600, 1, 1 );
    _id_A5A8::_id_186A( "allies" );
    _id_A5A8::_id_185A();
    _id_A5A8::_id_184C( 0.33 );
}

_id_4D10()
{

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

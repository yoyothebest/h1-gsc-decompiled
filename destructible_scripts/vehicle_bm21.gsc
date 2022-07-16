// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("destructibles");

vehicle_bm21( var_0, var_1 )
{
    common_scripts\_destructible::_id_2906( var_0, "tag_body", 300, undefined, 32, "no_melee" );
    common_scripts\_destructible::_id_2920( "tag_hood_fx", "fx/smoke/car_damage_whitesmoke", 0.4 );
    common_scripts\_destructible::_id_2931( undefined, undefined, 200, undefined, 32, "no_melee" );
    common_scripts\_destructible::_id_2920( "tag_hood_fx", "fx/smoke/car_damage_blacksmoke", 0.4 );
    common_scripts\_destructible::_id_2931( undefined, undefined, 100, undefined, 32, "no_melee" );
    common_scripts\_destructible::_id_2920( "tag_hood_fx", "fx/smoke/car_damage_blacksmoke_fire", 0.4 );
    common_scripts\_destructible::_id_292A( "fire_vehicle_flareup_med" );
    common_scripts\_destructible::_id_2921( "fire_vehicle_med" );
    common_scripts\_destructible::_id_291D( 15, 0.25, 210, "allies" );
    common_scripts\_destructible::_id_2931( undefined, undefined, 300, "player_only", 32, "no_melee" );
    common_scripts\_destructible::_id_2921( "fire_vehicle_med" );
    common_scripts\_destructible::_id_2931( undefined, undefined, 400, undefined, 32, "no_melee" );
    common_scripts\_destructible::_id_2912( "tag_deathfx", "fx/explosions/small_vehicle_explosion", 0 );
    common_scripts\_destructible::_id_292A( "car_explode" );
    common_scripts\_destructible::_id_290D( 4000, 5000, 210, 250, 50, 300, undefined, undefined, 0.3, 500 );
    common_scripts\_destructible::_id_28FA( %vehicle_80s_sedan1_destroy, #animtree, "setanimknob", undefined, undefined, "vehicle_80s_sedan1_destroy" );
    common_scripts\_destructible::_id_2931( undefined, var_1, undefined, 32, "no_melee" );
    common_scripts\_destructible::_id_2924( "left_wheel_01_jnt", undefined, 20, undefined, undefined, "no_melee" );
    common_scripts\_destructible::_id_28FA( %vehicle_80s_sedan1_flattire_lf, #animtree, "setanim" );
    common_scripts\_destructible::_id_292A( "veh_tire_deflate", "bullet" );
    common_scripts\_destructible::_id_2924( "left_wheel_02_jnt", undefined, 20, undefined, undefined, "no_melee" );
    common_scripts\_destructible::_id_28FA( %vehicle_80s_sedan1_flattire_lb, #animtree, "setanim" );
    common_scripts\_destructible::_id_292A( "veh_tire_deflate", "bullet" );
    common_scripts\_destructible::_id_2924( "right_wheel_01_jnt", undefined, 20, undefined, undefined, "no_melee" );
    common_scripts\_destructible::_id_28FA( %vehicle_80s_sedan1_flattire_rf, #animtree, "setanim" );
    common_scripts\_destructible::_id_292A( "veh_tire_deflate", "bullet" );
    common_scripts\_destructible::_id_2924( "right_wheel_02_jnt", undefined, 20, undefined, undefined, "no_melee" );
    common_scripts\_destructible::_id_28FA( %vehicle_80s_sedan1_flattire_rb, #animtree, "setanim" );
    common_scripts\_destructible::_id_292A( "veh_tire_deflate", "bullet" );
    var_2 = "tag_glass_front";
    common_scripts\_destructible::_id_2924( var_2, undefined, 40, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_2 + "_d", undefined, 60, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( "tag_glass_front_fx", "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_2 = "tag_glass_back";
    common_scripts\_destructible::_id_2924( var_2, undefined, 40, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_2 + "_d", undefined, 60, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( "tag_glass_back_fx", "fx/props/car_glass_large" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_2 = "tag_glass_left_front";
    common_scripts\_destructible::_id_2924( var_2, undefined, 20, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_2 + "_d", undefined, 60, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( "tag_glass_left_front_fx", "fx/props/car_glass_med" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
    var_2 = "tag_glass_right_front";
    common_scripts\_destructible::_id_2924( var_2, undefined, 20, undefined, undefined, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2931( var_2 + "_d", undefined, 60, undefined, undefined, undefined, 1 );
    common_scripts\_destructible::_id_2912( "tag_glass_right_front_fx", "fx/props/car_glass_med" );
    common_scripts\_destructible::_id_292A( "veh_glass_break_large" );
    common_scripts\_destructible::_id_2931( undefined );
}

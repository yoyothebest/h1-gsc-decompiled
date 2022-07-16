// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["bird_seagull_flock_flying_runner"] = loadfx( "vfx/animal/bird_seagull_flock_flying_runner" );
    level._id_058F["hallway_smoke_light"] = loadfx( "fx/smoke/hallway_smoke_light" );
    level._id_058F["battlefield_smokebank_s"] = loadfx( "fx/smoke/battlefield_smokebank_s" );
    level._id_058F["light_shaft_mp_countdown"] = loadfx( "fx/dust/light_shaft_mp_countdown" );
    level._id_058F["light_red_blink_mp_countdown"] = loadfx( "vfx/lights/light_red_blink_mp_countdown" );
    level._id_058F["mist_vista_countdown_mp"] = loadfx( "vfx/fog/mist_vista_countdown_mp" );
    level._id_058F["light_spotlight_cone_haze_dim_mp_countdown"] = loadfx( "vfx/lights/light_spotlight_cone_haze_dim_mp_countdown" );
    level._id_058F["insects_carcass_flies_mp_countdown"] = loadfx( "fx/misc/insects_carcass_flies_mp_countdown" );
    level._id_058F["wood"] = loadfx( "fx/explosions/grenadeExp_wood" );
    level._id_058F["dust"] = loadfx( "fx/explosions/grenadeExp_dirt_1" );
    level._id_058F["brick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._id_058F["coolaidmanbrick"] = loadfx( "fx/explosions/grenadeExp_concrete_1" );
    level._id_058F["launchtube_steam"] = loadfx( "fx/smoke/launchtube_steam_mp_countdown" );
    level._id_058F["smoke_missile_launched"] = loadfx( "fx/smoke/smoke_launchtubes_countdown_mp" );
    level._id_058F["ground_smoke_launch_a"] = loadfx( "fx/smoke/ground_smoke_mp_countdown" );
    level._id_058F["heavy_mist_countdown_mp"] = loadfx( "fx/weather/heavy_mist_countdown_mp" );
    level._id_058F["battlefield_smokebank_bog_a"] = loadfx( "fx/smoke/battlefield_smokebank_bog_a" );
    level._id_058F["fog vista"] = loadfx( "vfx/fog/fog_vista_countdown_mp" );
    level._id_058F["fx_sunflare_mp_countdown"] = loadfx( "vfx/lensflare/fx_sunflare_mp_countdown" );
}

ambientfx()
{
    var_0 = common_scripts\utility::_id_242E( "smoke_missile_launched" );
    var_0._id_9C42["origin"] = ( 632, 936, -200 );
    var_0._id_9C42["angles"] = ( 270, 0, 0 );
    var_0._id_9C42["delay"] = -120;
    var_0 = common_scripts\utility::_id_242E( "smoke_missile_launched" );
    var_0._id_9C42["origin"] = ( 632, -24, -200 );
    var_0._id_9C42["angles"] = ( 270, 0, 0 );
    var_0._id_9C42["delay"] = -120;
    var_0 = common_scripts\utility::_id_242E( "smoke_missile_launched" );
    var_0._id_9C42["origin"] = ( -600, -24, -200 );
    var_0._id_9C42["angles"] = ( 270, 0, 0 );
    var_0._id_9C42["delay"] = -120;
    var_0 = common_scripts\utility::_id_242E( "launchtube_steam" );
    var_0._id_9C42["origin"] = ( -656, 1052, 0 );
    var_0._id_9C42["angles"] = ( 0, 0, 0 );
    var_0._id_9C42["delay"] = -120;
}

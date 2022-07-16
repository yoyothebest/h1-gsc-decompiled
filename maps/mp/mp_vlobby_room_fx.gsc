// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["pigeon_flock_vista_loop"] = loadfx( "vfx/animal/pigeon_flock_vista_loop" );
    level._id_058F["vlobby_light_red"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_light_red" );
    level._id_058F["vlobby_c130_motes"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_c130_motes" );
    level._id_058F["crate_dryice_vlobby"] = loadfx( "vfx/map/mp_vlobby_room/crate_dryice_vlobby" );
    level._id_058F["mug_steam_vlobby"] = loadfx( "vfx/map/mp_vlobby_room/mug_steam_vlobby" );
    level._id_058F["vlobby_c130_dust"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_c130_dust" );
    level._id_058F["vlobby_c130_smoke"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_c130_smoke" );
    level._id_058F["round_glow_lightbulb"] = loadfx( "vfx/map/mp_vlobby_room/round_glow_lightbulb" );
    level._id_058F["ambient_hallway_dust_mp"] = loadfx( "vfx/map/mp_citystreets/ambient_hallway_dust_mp" );
    level._id_058F["flight02_spotlight_gobo"] = loadfx( "vfx/lights/mp_vlobby_refraction/flight02_spotlight_gobo" );
    level._id_058F["flashlight_spotlight_gobo"] = loadfx( "vfx/lights/mp_vlobby_refraction/flashlight_spotlight_gobo" );
    level._id_058F["vlobby_dust"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_dust" );
    level._id_058F["vlobby_steam"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_steam" );
    level._id_058F["vlobby_front_steam"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_front_steam" );
    level._id_058F["vlobby_vista_explosion_runner"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_vista_explosion_runner" );
    level._id_058F["paper_falling"] = loadfx( "fx/misc/paper_falling_slow" );
    level._id_058F["watermelon"] = loadfx( "fx/props/watermelon" );
}

loadprecacheddepoteffects()
{
    level._id_058F["cigarette_exhale_vlobby"] = loadfx( "vfx/smoke/cigarette_exhale_vlobby" );
    level._id_058F["cigarette_endglow_vlobby"] = loadfx( "vfx/smoke/cigarette_endglow_vlobby" );
    level._id_058F["cigarette_flick_trail_vlobby"] = loadfx( "vfx/smoke/cigarette_flick_trail_vlobby" );
    level._id_058F["cigarette_ash_vlobby"] = loadfx( "vfx/smoke/cigarette_ash_vlobby" );
    level._id_058F["cigarette_smk_vlobby"] = loadfx( "vfx/smoke/cigarette_smk_vlobby" );
    level._id_058F["loot_card_trail_common"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_common_trail" );
    level._id_058F["loot_card_trail_rare"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_rare_trail" );
    level._id_058F["loot_card_trail_legendary"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_leg_trail" );
    level._id_058F["loot_card_trail_epic"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_epic_trail" );
    level._id_058F["vlobby_pistol_flash"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_pistol_flash" );
    level._id_058F["pistol"] = loadfx( "vfx/shelleject/pistol" );
    level._id_058F["vlobby_cellphone_light"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_cellphone_light" );
    level._id_058F["cigarette_exhnose_vlobby"] = loadfx( "vfx/smoke/cigarette_exhnose_vlobby" );
    level._id_058F["loot_sticker_wolf"] = loadfx( "vfx/loot/mp_loot_sticker_wolf" );
    level._id_058F["loot_sticker_wolf_rare"] = loadfx( "vfx/loot/mp_loot_sticker_wolf_blue" );
    level._id_058F["vlobby_crate_rare_glow"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_crate_rare_glow" );
    level._id_058F["vlobby_crate_epic_glow"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_crate_epic_glow" );
    level._id_058F["vlobby_crate_leg_glow"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_crate_leg_glow" );
    level._id_058F["vlobby_crate_glow"] = loadfx( "vfx/map/mp_vlobby_room/vlobby_crate_glow" );
    level._id_058F["smoke_crate_open"] = loadfx( "vfx/map/mp_vlobby_room/smoke_crate_open" );
    level._id_058F["loot_sticker_lion"] = loadfx( "vfx/loot/mp_loot_sticker_lion_common" );
    level._id_058F["loot_sticker_lion_rare"] = loadfx( "vfx/loot/mp_loot_sticker_lion_rare" );
    level._id_058F["loot_sticker_copperhead"] = loadfx( "vfx/loot/mp_loot_sticker_copperhead_common" );
    level._id_058F["loot_sticker_copperhead_rare"] = loadfx( "vfx/loot/mp_loot_sticker_copperhead_rare" );
    setupdepotexploders();
}

setupdepotexploders()
{
    var_0 = common_scripts\utility::_id_23FE( "vlobby_crate_glow" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 14089, 1251.84, -609.323 ), ( 270, 152.37, 157.63 ) );
    var_0 common_scripts\_createfx::_id_7E40();
    var_0._id_9C42["fxid"] = "vlobby_crate_glow";
    var_0._id_9C42["delay"] = 0;
    var_0._id_9C42["exploder"] = "106";
    var_0 = common_scripts\utility::_id_23FE( "vlobby_crate_rare_glow" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 14089, 1251.84, -608.323 ), ( 270, 152.37, 157.63 ) );
    var_0 common_scripts\_createfx::_id_7E40();
    var_0._id_9C42["fxid"] = "vlobby_crate_rare_glow";
    var_0._id_9C42["delay"] = 0;
    var_0._id_9C42["exploder"] = "109";
    var_0 = common_scripts\utility::_id_23FE( "vlobby_crate_leg_glow" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 14089, 1251.84, -607.323 ), ( 270, 152.37, 157.63 ) );
    var_0 common_scripts\_createfx::_id_7E40();
    var_0._id_9C42["fxid"] = "vlobby_crate_leg_glow";
    var_0._id_9C42["delay"] = 0;
    var_0._id_9C42["exploder"] = "112";
    var_0 = common_scripts\utility::_id_23FE( "vlobby_crate_epic_glow" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 14089, 1251.84, -606.323 ), ( 270, 152.37, 157.63 ) );
    var_0 common_scripts\_createfx::_id_7E40();
    var_0._id_9C42["fxid"] = "vlobby_crate_epic_glow";
    var_0._id_9C42["delay"] = 0;
    var_0._id_9C42["exploder"] = "115";
    var_0 = common_scripts\utility::_id_23FE( "smoke_crate_open" );
    var_0 common_scripts\_createfx::_id_7E8F( ( 14088.3, 1253.98, -612.744 ), ( 352.008, 131.04, -89.7203 ) );
    var_0 common_scripts\_createfx::_id_7E40();
    var_0._id_9C42["fxid"] = "smoke_crate_open";
    var_0._id_9C42["delay"] = 0;
    var_0._id_9C42["exploder"] = "201";
}

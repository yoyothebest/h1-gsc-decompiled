// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    if ( getdvarint( "use_old_intro" ) == 1 )
    {
        level._id_78AC["price"]["opening"] = %village_intro_price;
        level._id_78AC["opening_guy"]["opening"] = %village_intro_contact;
    }
    else
    {
        level._id_78AC["price"]["opening"] = %h1_village_intro_price;
        level._id_78AC["opening_guy"]["opening"] = %h1_village_intro_contact;
        _id_A510::_id_080B( "price", "dialog", "opening", "vassault_pri_kamarovsman" );
        _id_A510::_id_080B( "price", "dialog", "opening", "vassault_pri_perfect" );
        _id_A510::_id_080B( "opening_guy", "dialog", "opening", "vassault_ru4_asadinvillage" );
    }

    level._id_78BA["price"]["kamarovsman"] = "vassault_pri_kamarovsman";
    level._id_78BA["opening_guy"]["asadinvillage"] = "vassault_ru4_asadinvillage";
    level._id_78BA["price"]["perfect"] = "vassault_pri_perfect";
    level._id_78BA["gaz"]["whatsgoingon"] = "vassault_gaz_whatsgoingon";
    level._id_78BA["opening_guy"]["killingvillagers"] = "vassault_ru4_killingvillagers";
    level._id_78BA["gaz"]["notforlong"] = "vassault_gaz_notforlong";

    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        level._id_78AC["price"]["interrogationA"] = %village_interrogationa_price;
        level._id_78AC["alasad"]["interrogationA"] = %village_interrogationa_zak;
        _id_A510::_id_0807( "price", "gun_2_chest", maps\village_assault_code::alasad_notetracks, "interrogationA" );
        level._id_78AC["price"]["interrogationB"] = %village_interrogationb_price;
        level._id_78AC["gaz"]["interrogationB"] = %village_interrogationb_gaz;
        level._id_78AC["alasad"]["interrogationB"] = %village_interrogationb_zak;
    }
    else
    {
        level._id_78AC["price"]["interrogationA_run_in"] = %h1_village_interrogationa_price_run_in;
        level._id_78AC["price"]["interrogationA_idle"][0] = %h1_village_interrogationa_price_idle;
        level._id_78AC["price"]["interrogationA"] = %h1_village_interrogationa_price;
        level._id_78AC["alasad"]["interrogationA"] = %h1_village_interrogationa_zak;
        _id_A510::_id_0807( "price", "gun_2_chest", maps\village_assault_code::alasad_notetracks, "interrogationA" );
        _id_A510::_id_0807( "price", "dialog", ::price_interrogation_voiceover_genericfacial, "interrogationA" );
        _id_A510::_id_0807( "price", "punch", ::price_interrogation_punch_fx, "interrogationA" );
        level._id_78AC["price"]["interrogationB"] = %h1_village_interrogationb_price;
        _id_A510::_id_0807( "price", "punch", ::price_interrogation_punch_fx, "interrogationB" );
        level._id_78AC["gaz"]["interrogationB"] = %h1_village_interrogationb_gaz;
        level._id_78AC["alasad"]["interrogationB"] = %h1_village_interrogationb_zak;
        _id_A510::_id_080B( "gaz", "dialog", "interrogationB", "vassault_gaz_cellphone" );
    }

    _id_7A3B();
    animated_model_setup();
    _id_29E7();
}
#using_animtree("script_model");

_id_7A3B()
{
    if ( getdvarint( "use_old_interrogation" ) == 1 )
    {
        level._id_78AC["door"]["interrogationA"] = %village_interrogationa_door;
        level._id_78B1["door"] = #animtree;
        level._id_78B5["door"] = "com_door_01_handleleft_brown";
        level._id_78AC["phone"]["interrogationA"] = %village_interrogationa_phone;
        level._id_78B1["phone"] = #animtree;
        level._id_78B5["phone"] = "com_cellphone_on_ANIM";
        level._id_78AC["chair"]["interrogationB"] = %village_interrogationb_chair;
        level._id_78B1["chair"] = #animtree;
        level._id_78B5["chair"] = "com_folding_chair";
        level._id_78AC["phone"]["interrogationB"] = %village_interrogationb_phone;
        level._id_78B1["phone"] = #animtree;
        level._id_78B5["phone"] = "com_cellphone_on_ANIM";
    }
    else
    {
        level._id_78AC["door"]["interrogationA"] = %h1_village_interrogationa_door;
        level._id_78B1["door"] = #animtree;
        level._id_78B5["door"] = "com_door_01_handleleft_brown";
        level._id_78AC["phone"]["interrogationA"] = %h1_village_interrogationa_phone;
        level._id_78B1["phone"] = #animtree;
        level._id_78B5["phone"] = "com_cellphone_on_ANIM";
        level._id_78AC["rope"]["interrogationA"] = %h1_village_interrogationa_rope;
        level._id_78B1["rope"] = #animtree;
        level._id_78B5["rope"] = "h1_choke_rope";
        level._id_78AC["chair"]["interrogationB"] = %h1_village_interrogationb_chair;
        level._id_78B1["chair"] = #animtree;
        level._id_78B5["chair"] = "com_folding_chair";
        level._id_78AC["phone"]["interrogationB"] = %h1_village_interrogationb_phone;
        level._id_78B1["phone"] = #animtree;
        level._id_78B5["phone"] = "com_cellphone_on_ANIM";
        level._id_78AC["rope"]["interrogationB"] = %h1_village_interrogationb_rope;
        level._id_78B1["rope"] = #animtree;
        level._id_78B5["rope"] = "h1_choke_rope";
        level._id_78AC["handrope"]["interrogationB"] = %h1_village_interrogationb_handrope;
        level._id_78B1["handrope"] = #animtree;
        level._id_78B5["handrope"] = "h1_alasad_rope";
    }
}
#using_animtree("animated_props");

animated_model_setup()
{
    level._id_0BEC["foliage_birch_tree_b_green_hero"]["still"] = %foliage_birch_tree_hero_still;
    level._id_0BEC["foliage_birch_tree_b_green_hero"]["strong"] = %foliage_birch_tree_hero_sway;
    level._id_0BEC["foliage_birch_tree_b_green_hero"]["heli"] = %foliage_birch_tree_hero_heliwash;
    level._id_0BEC["h1_tree_pine_evergreen_03_hero"]["still"] = %h1_tree_pine_evergreen_03_hero_still;
    level._id_0BEC["h1_tree_pine_evergreen_03_hero"]["strong"] = %h1_tree_pine_evergreen_03_hero_sway;
    level._id_0BEC["h1_tree_pine_evergreen_03_hero"]["heli"] = %h1_tree_pine_evergreen_03_hero_heliwash;
}

_id_29E7()
{
    level._id_78BA["price"]["nogooddead"] = "vassault_pri_nogooddead";
    level._id_78BA["price"]["airsupport"] = "vassault_pri_airsupport";
    level._id_78BA["price"]["softenup"] = "vassault_pri_softenup";
    level._id_78BA["gaz"]["nosign"] = "vassault_gaz_nosign";
    level._id_78BA["gaz"]["nextone"] = "vassault_gaz_nextone";
    level._id_78BA["gaz"]["checkother"] = "vassault_gaz_checkother";
    level._id_78BA["gaz"]["checknext"] = "vassault_gaz_checknext";
    level._id_78B9["ontheway"] = "vassault_rhp_ontheway";
    level._id_78B9["helicopteronway"] = "vassault_rhp_helicopteronway";
    level._id_78B9["wehavetarget"] = "vassault_rhp_wehavetarget";
    level._id_78B9["refuelandrearm"] = "vassault_rhp_refuelandrearm";
    level._id_78B9["readytoattack"] = "vassault_rhp_readytoattack";
    level._id_78B9["refueling"] = "vassault_rhp_refueling";
    level._id_78B9["rearming"] = "vassault_rhp_rearming";
    level._id_78BA["price"]["whydyoudoit"] = "vassault_pri_whydyoudoit";
    level._id_78BA["alasad"]["wasntme1"] = "vassault_kaa_wasntme1";
    level._id_78BA["price"]["whothen"] = "vassault_pri_whothen";
    level._id_78BA["alasad"]["wasntme2"] = "vassault_kaa_wasntme2";
    level._id_78BA["price"]["givemeaname"] = "vassault_pri_givemeaname";
    level._id_78BA["price"]["aname"] = "vassault_pri_aname";
    level._id_78BA["gaz"]["cellphone"] = "vassault_gaz_cellphone";
    level._id_78BA["gaz"]["whowasthat"] = "vassault_gaz_whowasthat";
    level._id_78BA["price"]["zakhaev"] = "vassault_pri_zakhaev";
    level._id_78BA["price"]["imran"] = "vassault_pri_imran";
}

price_interrogation_voiceover_genericfacial( var_0 )
{
    var_0 _id_A510::_id_0C21( var_0, "nogooddead" );
}

price_interrogation_punch_fx( var_0 )
{
    if ( !isdefined( level._id_6F7C.interrogation_punch_counter ) )
        level._id_6F7C.interrogation_punch_counter = 0;

    var_1 = "va_";

    if ( level._id_6F7C.interrogation_punch_counter == 0 )
        var_1 += "pistol_whip";
    else
        var_1 += ( "punch_0" + level._id_6F7C.interrogation_punch_counter );

    var_2 = level.alasad _meth_8184( "j_head" );
    var_3 = level.alasad _meth_8185( "j_head" );
    playfx( level._id_058F[var_1], var_2, anglestoforward( var_3 ) );
    level._id_6F7C.interrogation_punch_counter++;
}

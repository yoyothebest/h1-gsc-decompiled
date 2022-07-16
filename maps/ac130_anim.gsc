// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    setup_exploder_anims();
    building_destruction();
    level._id_78AC["civiliandriver_car1"]["idle"][0] = %jeep_driver_driving;
    level._id_78AC["civiliandriver_car2"]["idle"][0] = %jeep_driver_driving;
    level._id_78AC["civiliandriver_car1"]["stop"][0] = %rubicon_idle_driver;
    level._id_78AC["civiliandriver_car2"]["stop"][0] = %rubicon_idle_driver;
    level._id_78AC["civiliandriver_car1"]["runaway"] = %h1_hunted_farmer_runaway;
    level._id_78AC["civiliandriver_car2"]["runaway"] = %h1_hunted_farmer_runaway;
    level._id_78AC["civiliandriver_car1"]["hijack"] = %ac130_carjack_driver_1a;
    level._id_78AC["civiliandriver_car2"]["hijack"] = %ac130_carjack_driver_1b;
    level._id_78AC["hijacker_car1_guy1"]["hijack"] = %ac130_carjack_1a;
    level._id_78AC["hijacker_car1_guy2"]["hijack"] = %ac130_carjack_2;
    level._id_78AC["hijacker_car1_guy3"]["hijack"] = %ac130_carjack_3;
    level._id_78AC["hijacker_car1_guy4"]["hijack"] = %ac130_carjack_4;
    _id_A510::_id_0807( "hijacker_car1_guy1", "start_others", maps\ac130_code::do_hijack_others );
    level._id_78AC["hijacker_car2_guy1"]["hijack"] = %ac130_carjack_1b;
    level._id_78AC["hijacker_car2_guy2"]["hijack"] = %ac130_carjack_2;
    level._id_78AC["hijacker_car2_guy3"]["hijack"] = %ac130_carjack_3;
    level._id_78AC["hijacker_car2_guy4"]["hijack"] = %ac130_carjack_4;
    _id_A510::_id_0807( "hijacker_car2_guy1", "start_others", maps\ac130_code::do_hijack_others );
    level._id_78AC["hijacker_car1_guy1"]["idle"][0] = %bm21_driver_idle;
    level._id_78AC["hijacker_car1_guy2"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car1_guy3"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car1_guy4"]["idle"][0] = %technical_passenger_idle_right;
    level._id_78AC["hijacker_car2_guy1"]["idle"][0] = %bm21_driver_idle;
    level._id_78AC["hijacker_car2_guy2"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car2_guy3"]["idle"][0] = %technical_passenger_idle;
    level._id_78AC["hijacker_car2_guy4"]["idle"][0] = %technical_passenger_idle_right;
    level._id_78AC["hijacker_car1_guy1"]["getout"] = %pickup_driver_climb_out;
    level._id_78AC["hijacker_car1_guy2"]["getout"] = %pickup_passenger_climb_out;
    level._id_78AC["hijacker_car1_guy3"]["getout"] = %pickup_passenger_rr_climb_out;
    level._id_78AC["hijacker_car1_guy4"]["getout"] = %pickup_passenger_rl_climb_out;
    level._id_78AC["hijacker_car2_guy1"]["getout"] = %pickup_driver_climb_out;
    level._id_78AC["hijacker_car2_guy2"]["getout"] = %pickup_passenger_climb_out;
    level._id_78AC["hijacker_car2_guy3"]["getout"] = %pickup_passenger_rr_climb_out;
    level._id_78AC["hijacker_car2_guy4"]["getout"] = %pickup_passenger_rl_climb_out;
}

setup_exploder_anims()
{
    level.exploder_animtrees = [];
    level.exploder_animtrees[0] = "exploder_script_model";
}
#using_animtree("script_model");

building_destruction()
{
    level._id_78B1["exploder_script_model"] = #animtree;
    level._id_78AC["exploder_script_model"]["h1_ac130_watertower0_anim"] = %h1_ac130_watertower0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_watertower1_anim"] = %h1_ac130_watertower1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_crane0_anim"] = %h1_ac130_crane0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_crane1_anim"] = %h1_ac130_crane1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story0_anim"] = %h1_ac130_l2story0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story1_anim"] = %h1_ac130_l2story1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story2_anim"] = %h1_ac130_l2story2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_l2story3_anim"] = %h1_ac130_l2story3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm0_anim"] = %h1_ac130_shed_sm0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm1_anim"] = %h1_ac130_shed_sm1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm2_anim"] = %h1_ac130_shed_sm2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_shed_sm3_anim"] = %h1_ac130_shed_sm3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm0_anim"] = %h1_ac130_barn_sm0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm1_anim"] = %h1_ac130_barn_sm1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm2_anim"] = %h1_ac130_barn_sm2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_barn_sm3_anim"] = %h1_ac130_barn_sm3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d0_anim"] = %h1_ac130_2story_d0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d1_anim"] = %h1_ac130_2story_d1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d2_anim"] = %h1_ac130_2story_d2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d3_anim"] = %h1_ac130_2story_d3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_2story_d4_anim"] = %h1_ac130_2story_d4_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d0_anim"] = %h1_ac130_1story_house_d0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d1_anim"] = %h1_ac130_1story_house_d1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d2_anim"] = %h1_ac130_1story_house_d2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d3_anim"] = %h1_ac130_1story_house_d3_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story_house_d4_anim"] = %h1_ac130_1story_house_d4_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story0_anim"] = %h1_ac130_1story0_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story1_anim"] = %h1_ac130_1story1_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story2_anim"] = %h1_ac130_1story2_anim;
    level._id_78AC["exploder_script_model"]["h1_ac130_1story3_anim"] = %h1_ac130_1story3_anim;
}

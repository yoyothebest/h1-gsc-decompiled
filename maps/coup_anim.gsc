// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    anim_human();
    anim_playerview();
    anim_vehicles();
    anim_door();
    anim_trashcan();
    anim_dumpster();
    _id_0BEE();
    anim_chickens();
    anim_dogs();
    _id_A573::_id_0796( "human" );
}
#using_animtree("player");

anim_playerview()
{
    level._id_78B1["playerview"] = #animtree;
    level._id_78B5["playerview"] = "worldbody_h1_vip_president";
    level._id_78AC["playerview"]["intro"] = %coup_opening_playerview;
    level._id_78AC["playerview"]["car_idle_fullbody"] = %h1_coup_player_idle;
    level._id_78AC["playerview"]["car_idle"][0] = %coup_opening_playerview_idle;
    level._id_78AC["playerview"]["car_idle_firstframe"] = %coup_opening_playerview_idle;
    level._id_78AC["playerview"]["carexit"] = %coup_ending_drag_playerview;
    level._id_78AC["playerview"]["endtaunt"] = %coup_ending_zakhaev_intro_playerview;
    level._id_78AC["playerview"]["ending"] = %coup_ending_player;
    level._id_78AC["playerview"]["playerview_idle_normal"] = %coup_opening_playerview_idle_normal;
    level._id_78AC["playerview"]["playerview_idle_smooth"] = %coup_opening_playerview_idle_smooth;
    level._id_78AC["playerview"]["playerview_idle_bumpy"] = %coup_opening_playerview_idle_bumpy;
    level._id_78AC["playerview"]["playerview_idle_static"] = %coup_opening_playerview_idle_static;
    _id_A510::_id_080C( "playerview", "start_car_rearview_mirror_video", "start_car_rearview_mirror_video" );
    _id_A510::_id_0807( "playerview", "throw_in_car", ::playerthrownincar, "intro" );
    _id_A510::_id_0807( "playerview", "hit", ::playerhit, "intro" );
    _id_A510::_id_0807( "playerview", "pulled_from_car", ::playerpulledfromcar, "carexit" );
    _id_A510::_id_0807( "playerview", "kick", ::playerkicked, "carexit" );
}
#using_animtree("generic_human");

anim_human()
{
    level._id_78B1["human"] = #animtree;
    level._id_78AC["human"]["stand_and_crouch"] = %stand_and_crouch;
    level._id_78AC["human"]["cardriver_idle"][0] = %coup_driver_idle;
    level._id_78AC["human"]["cardriver_bigleft2center"] = %coup_driver_bigleft2center;
    level._id_78AC["human"]["cardriver_bigleft_idle"][0] = %coup_driver_bigleft_idle;
    level._id_78AC["human"]["cardriver_bigleftloop"] = %coup_driver_bigleft_loop;
    level._id_78AC["human"]["cardriver_center2smallleft"] = %coup_driver_center2smallleft;
    level._id_78AC["human"]["cardriver_center2smallright"] = %coup_driver_center2smallright;
    level._id_78AC["human"]["cardriver_lookright"] = %coup_driver_lookright;
    level._id_78AC["human"]["cardriver_smallleft2bigleft"] = %coup_driver_smallleft2bigleft;
    level._id_78AC["human"]["cardriver_smallleft2center"] = %coup_driver_smallleft2center;
    level._id_78AC["human"]["cardriver_smallleft_idle"][0] = %coup_driver_smallleft_idle;
    level._id_78AC["human"]["cardriver_smallright2center"] = %coup_driver_smallright2center;
    level._id_78AC["human"]["cardriver_smallright_idle"][0] = %coup_driver_smallright_idle;
    level._id_78AC["human"]["cardriver_wave1"] = %coup_driver_wave1;
    level._id_78AC["human"]["cardriver_wave2"] = %coup_driver_wave2;
    level._id_78AC["human"]["cardriver_fulldrive"] = %h1_coup_03_driver_idle;
    level._id_78AC["human"]["carpassenger_idle"][0] = %coup_passenger_idle;
    level._id_78AC["human"]["carpassenger_phone"] = %coup_passenger_phone;
    level._id_78AC["human"]["carpassenger_point"] = %coup_passenger_point;
    level._id_78AC["human"]["carpassenger_pointturn"] = %coup_passenger_pointturn;
    level._id_78AC["human"]["carpassenger_lookback"] = %coup_passenger_lookback;
    level._id_78AC["human"]["carpassenger_lookright"] = %coup_passenger_lookright;
    level._id_78AC["human"]["carpassenger_shiftweight"] = %coup_passenger_shiftweight;
    level._id_78AC["human"]["carpassenger_fulldrive"] = %h1_coup_03_passenger_idle;
    level._id_78AC["human"]["intro_leftguard"] = %coup_opening_guyl;
    level._id_78AC["human"]["intro_rightguard"] = %coup_opening_guyr;
    level._id_78AC["human"]["intro_idle_soldier_left"] = %h1_coup_01_soldieraidlestanding_left;
    level._id_78AC["human"]["intro_idle_soldier_right"] = %h1_coup_01_soldierbidlestanding_right;
    level._id_78AC["human"]["intro_cardriver"] = %h1_coup_01_driver;
    level._id_78AC["human"]["intro_carpassenger"] = %h1_coup_01_zakhaevson;
    level._id_78AC["human"]["intro_spittingguard"] = %h1_coup_01_soldierdspitting;
    level._id_78AC["human"]["intro_soldierholdcivilian"] = %h1_coup_01_soldiercholdcivilian;
    level._id_78AC["human"]["intro_civilianliesdown"] = %h1_coup_01_civilianliesdown;
    level._id_78AC["human"]["carexit_leftguard"] = %coup_ending_drag_guyl;
    level._id_78AC["human"]["carexit_rightguard"] = %coup_ending_drag_guyr;
    level._id_78AC["human"]["carexit_driver"] = %h1_coup_24_driver;
    level._id_78AC["human"]["carexit_passenger"] = %h1_coup_24_zakhaevson;
    level._id_78AC["human"]["close_garage_a"] = %unarmed_close_garage;
    level._id_78AC["human"]["close_garage_b"] = %unarmed_close_garage_v2;
    level._id_78AC["human"]["window_shout_a"] = %unarmed_shout_window;
    level._id_78AC["human"]["window_shout_b"] = %unarmed_shout_window_v2;
    level._id_78AC["human"]["leaning_smoking_idle"][0] = %parabolic_leaning_guy_smoking_idle;
    level._id_78AC["human"]["radio"] = %casual_stand_v2_twitch_radio;
    level._id_78AC["human"]["talkingguards_leftguard"] = %coup_talking_patrol_guy1;
    level._id_78AC["human"]["talkingguards_rightguard"] = %coup_talking_patrol_guy2;
    level._id_78AC["human"]["ending_leftguard"] = %coup_ending_guyl;
    level._id_78AC["human"]["ending_rightguard"] = %coup_ending_guyr;
    level._id_78AC["human"]["ending_alasad"] = %coup_ending_alasad;
    level._id_78AC["human"]["ending_zakhaev"] = %coup_ending_zakhaev;
    level._id_78AC["human"]["endtaunt"] = %coup_ending_zakhaev_intro;
    level._id_78AC["human"]["ziptie_civilian_idle"][0] = %ziptie_suspect_idle;
    level._id_78AC["human"]["crowdmember_gunup_idle"] = %coup_guard1_idle;
    level._id_78AC["human"]["crowdmember_gunup_fire"] = %coup_guard1_jeer;
    level._id_78AC["human"]["crowdmember_gundown_idle"] = %coup_guard2_idle;
    level._id_78AC["human"]["crowdmember_gundown_jeer"] = %coup_guard2_jeera;
    level._id_78AC["human"]["crowdmember_gundown_fire_a"] = %coup_guard2_jeerb;
    level._id_78AC["human"]["crowdmember_gundown_fire_b"] = %coup_guard2_jeerc;
    level._id_78AC["human"]["crowdmember_witnessing_arrival_gunup"][0] = %h1_coup_26_witnessingthearrival_soldier_01;
    level._id_78AC["human"]["crowdmember_witnessing_arrival_taunt"][0] = %h1_coup_26_witnessingthearrival_soldier_02;
    level._id_78AC["human"]["crowdmember_witnessing_arrival_cutroat_1"][0] = %h1_coup_26_witnessingthearrival_soldier_03;
    level._id_78AC["human"]["crowdmember_witnessing_arrival_cutroat_2"][0] = %h1_coup_26_witnessingthearrival_soldier_04;
    level._id_78AC["human"]["crowdmember_witnessing_arrival_spitting"][0] = %h1_coup_26_witnessingthearrival_soldier_05;
    level._id_78AC["human"]["crowdmember_witnessing_arrival_crossedarms"][0] = %h1_coup_26_witnessingthearrival_soldier_06;
    level._id_78AC["human"]["crowdmember_soldier_welcome_1"][0] = %h1_coup_soldiers_welcome_01;
    level._id_78AC["human"]["crowdmember_soldier_welcome_2"][0] = %h1_coup_soldiers_welcome_02;
    level._id_78AC["human"]["crowdmember_soldier_welcome_3"] = %h1_coup_soldiers_welcome_03;
    level._id_78AC["human"]["crowdmember_soldier_welcome_4"][0] = %h1_coup_soldiers_welcome_04;
    level._id_78AC["human"]["run_panicked1"] = %unarmed_panickedrun_loop_v1;
    level._id_78AC["human"]["run_panicked2"] = %unarmed_panickedrun_loop_v2;
    level._id_78AC["human"]["civilians_running_garage"] = %h1_coup_13_twocivilians_running_civil01;
    level._id_78AC["human"]["civilians_running_02"] = %h1_coup_13_twocivilians_running_civil02;
    level._id_78AC["human"]["civilians_running_03"] = %h1_coup_13_twocivilians_running_civil03;
    level._id_78AC["human"]["civilians_running_04"] = %h1_coup_13_twocivilians_running_civil04;
    level._id_78AC["human"]["runinto_garage_left"] = %unarmed_runinto_garage_left;
    level._id_78AC["human"]["runinto_garage_right"] = %unarmed_runinto_garage_right;
    level._id_78AC["human"]["spraypainting"] = %coup_spraypainting_sequence;
    _id_A510::_id_0807( "human", "start_spray", ::fx_paint_spray_coup, "spraypainting" );
    _id_A510::_id_0807( "human", "end_spray", ::fx_stop_paint_spray_coup, "spraypainting" );
    _id_A510::_id_0807( "human", "drop_can", ::detach_paint_spray_coup, "spraypainting" );
    level._id_78AC["human"]["civiliankilled_tumblesoncar"] = %h1_coup_opening_car_driving_civiliangetskilled_runner;
    level._id_78AC["human"]["civiliankilled_guard_a"] = %h1_coup_opening_car_driving_civiliangetskilled_soldiera;
    level._id_78AC["human"]["civiliankilled_guard_b"] = %h1_coup_opening_car_driving_civiliangetskilled_soldierb;
    level._id_78AC["human"]["wall_climb"] = %h1_coup_19_dogthreat;
    level._id_78AC["human"]["sneakattack_attack_side"] = %melee_l_attack;
    level._id_78AC["human"]["sneakattack_defend_side"] = %melee_l_defend;
    level._id_78AC["human"]["sneakattack_attack_behind"] = %melee_b_attack;
    level._id_78AC["human"]["sneakattack_defend_behind"] = %melee_b_defend;
    level._id_78AC["human"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["human"]["aim_straight"][0] = %stand_aim_straight;
    level._id_78AC["human"]["cowerstand_idle"][0] = %unarmed_cowerstand_idle;
    level._id_78AC["human"]["cowerstand_pointidle"][0] = %unarmed_cowerstand_pointidle;
    level._id_78AC["human"]["cowerstand_point_to_idle"] = %unarmed_cowerstand_point2idle;
    level._id_78AC["human"]["cowerstand_idle_to_point"] = %unarmed_cowerstand_idle2point;
    level._id_78AC["human"]["cowerstand_react"] = %unarmed_cowerstand_react;
    level._id_78AC["human"]["cowerstand_react_to_crouch"] = %unarmed_cowerstand_react_2_crouch;
    level._id_78AC["human"]["cowercrouch_idle"][0] = %unarmed_cowercrouch_idle;
    level._id_78AC["human"]["cowercrouch_idle_duck"] = %unarmed_cowercrouch_idle_duck;
    level._id_78AC["human"]["cowercrouch_react_a"] = %unarmed_cowercrouch_react_a;
    level._id_78AC["human"]["cowercrouch_react_b"] = %unarmed_cowercrouch_react_b;
    level._id_78AC["human"]["cowercrouch_to_stand"] = %unarmed_cowercrouch_crouch_2_stand;
    level._id_78AC["human"]["ziptie_guard"] = %ziptie_soldier;
    level._id_78AC["human"]["ziptie_civilian"] = %ziptie_suspect;
    level._id_78AC["human"]["doorkick_left_idle"] = %shotgunbreach_v1_shoot_hinge_idle;
    level._id_78AC["human"]["doorkick_left_stepout"] = %shotgunbreach_v1_shoot_hinge;
    level._id_78AC["human"]["doorkick_left_runin"] = %shotgunbreach_v1_shoot_hinge_runin;
    level._id_78AC["human"]["doorkick_right_idle"] = %shotgunbreach_v1_stackb_idle;
    level._id_78AC["human"]["doorkick_right_stepout_runin"] = %shotgunbreach_v1_stackb;
    level._id_78AC["human"]["carjack_victim"] = %ac130_carjack_driver_1a;
    level._id_78AC["human"]["carjack_driver"] = %ac130_carjack_1a;
    level._id_78AC["human"]["carjack_frontright"] = %ac130_carjack_2;
    level._id_78AC["human"]["carjack_backright"] = %ac130_carjack_3;
    level._id_78AC["human"]["carjack_backleft"] = %ac130_carjack_4;
    level._id_78AC["human"]["stand_idle"][0] = %casual_stand_idle;
    level._id_78AC["human"]["dumpster_open"] = %coup_dumpster_man;
    level._id_78AC["human"]["interrogation_suspect_a"] = %coup_civilians_interrogated_civilian_v1;
    level._id_78AC["human"]["interrogation_suspect_b"] = %coup_civilians_interrogated_civilian_v2;
    level._id_78AC["human"]["interrogation_suspect_c"] = %coup_civilians_interrogated_civilian_v3;
    level._id_78AC["human"]["interrogation_suspect_d"] = %coup_civilians_interrogated_civilian_v4;
    level._id_78AC["human"]["interrogation_guard_a"] = %coup_civilians_interrogated_guard_v1;
    level._id_78AC["human"]["interrogation_guard_b"] = %coup_civilians_interrogated_guard_v2;
    level._id_78AC["human"]["interrogation_civilian_4"] = %h1_coup_civilians_interrogated_civilian_v1;
    level._id_78AC["human"]["interrogation_civilian_5b"] = %h1_coup_civilians_interrogated_civilian_v2;
    level._id_78AC["human"]["interrogation_civilian_5"] = %h1_coup_civilians_interrogated_civilian_v3;
    level._id_78AC["human"]["interrogation_guard_4"] = %h1_coup_civilians_interrogated_guard_v1;
    level._id_78AC["human"]["interrogation_guard_5b"] = %h1_coup_civilians_interrogated_guard_v2;
    level._id_78AC["human"]["interrogation_guard_5"] = %h1_coup_civilians_interrogated_guard_v3;
    _id_A510::_id_0805( "human", "interrogation_guard_5b", "scream", "coup_scream_female" );
    _id_A510::_id_0805( "human", "interrogation_guard_5b", "death", "coup_death_female" );
    level._id_78B1["generic"] = #animtree;
    level._id_78AC["generic"]["patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["patrol_walk_twitch"] = %patrol_bored_patrolwalk_twitch;
    level._id_78AC["generic"]["patrol_stop"] = %patrol_bored_walk_2_bored;
    level._id_78AC["generic"]["patrol_start"] = %patrol_bored_2_walk;
    level._id_78AC["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level._id_78AC["generic"]["patrol_idle_1"] = %patrol_bored_idle;
    level._id_78AC["generic"]["patrol_idle_2"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["patrol_idle_3"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["patrol_idle_4"] = %patrol_bored_twitch_bug;
    level._id_78AC["generic"]["patrol_idle_5"] = %patrol_bored_twitch_checkphone;
    level._id_78AC["generic"]["patrol_idle_6"] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["patrol_idle_smoke"] = %patrol_bored_idle_smoke;
    level._id_78AC["generic"]["patrol_idle_checkphone"] = %patrol_bored_twitch_checkphone;
    level._id_78AC["generic"]["patrol_idle_stretch"] = %patrol_bored_twitch_stretch;
    level._id_78AC["generic"]["patrol_idle_phone"] = %patrol_bored_idle_cellphone;
    level._id_78AC["generic"]["npcline_run_wavearm"][0] = %coup_09_soldiers_front;
    level._id_78AC["generic"]["npcline_run_headdown"][0] = %coup_09_soldiers_middle;
    level._id_78AC["generic"]["npcline_run_lookback"][0] = %coup_09_soldiers_last;
    level._id_78AC["generic"]["npcline_run_generic"][0] = %coup_09_soldiers_oldone;
    level._id_78AC["generic"]["death_runners1"] = %s1_run_death_facedown;
    level._id_78AC["human"]["execution_victim_captain"] = %h1_coup_21_execution_captain;
    level._id_78AC["human"]["execution_victim_female_01"] = %h1_coup_21_execution_female_01;
    level._id_78AC["human"]["execution_victim_female_02"] = %h1_coup_21_execution_female_02;
    level._id_78AC["human"]["execution_victim_male_01_L"] = %h1_coup_21_execution_male_01_l;
    level._id_78AC["human"]["execution_victim_male_01_R"] = %h1_coup_21_execution_male_01_r;
    level._id_78AC["human"]["execution_victim_male_02_L"] = %h1_coup_21_execution_male_02_l;
    level._id_78AC["human"]["execution_victim_male_02_R"] = %h1_coup_21_execution_male_02_r;
    level._id_78AC["human"]["execution_victim_male_03_L"] = %h1_coup_21_execution_male_03_l;
    level._id_78AC["human"]["execution_victim_male_03_R"] = %h1_coup_21_execution_male_03_r;
    level._id_78AC["human"]["execution_victim_male_04_L"] = %h1_coup_21_execution_male_04_l;
    level._id_78AC["human"]["execution_victim_male_04_R"] = %h1_coup_21_execution_male_04_r;
    level._id_78AC["human"]["execution_soldier_01"] = %h1_coup_21_execution_soldiers_01;
    level._id_78AC["human"]["execution_soldier_02"] = %h1_coup_21_execution_soldiers_02;
    level._id_78AC["human"]["execution_soldier_03"] = %h1_coup_21_execution_soldiers_03;
    level._id_78AC["human"]["execution_soldier_04"] = %h1_coup_21_execution_soldiers_04;
    level._id_78AC["human"]["execution_soldier_05"] = %h1_coup_21_execution_soldiers_05;
    level._id_78AC["human"]["execution_soldier_06"] = %h1_coup_21_execution_soldiers_06;
    _id_A510::_id_0807( "human", "execution_fire", ::shootcivilianexecution );
    _id_A510::_id_0807( "human", "melee", ::melee_kill, "sneakattack_attack_side" );
    _id_A510::_id_0807( "human", "no death", ::rag_doll_death, "sneakattack_defend_side" );
    _id_A510::_id_0807( "human", "end", ::kill_self, "sneakattack_defend_side" );
    _id_A510::_id_0807( "human", "melee", ::melee_kill, "sneakattack_attack_behind" );
    _id_A510::_id_0807( "human", "no death", ::rag_doll_death, "sneakattack_defend_behind" );
    _id_A510::_id_0807( "human", "end", ::kill_self, "sneakattack_defend_behind" );
    _id_A510::_id_0808( "human", "detach gun", "weapon_desert_eagle_silver_HR_promo", "tag_inhand", "ending_zakhaev" );
    _id_A510::_id_0806( "human", "attach gun", "weapon_desert_eagle_silver_HR_promo", "tag_inhand", "ending_alasad" );
    _id_A510::_id_0806( "human", "attach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_phone" );
    _id_A510::_id_0808( "human", "detach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_phone" );
    _id_A510::_id_0806( "human", "attach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_fulldrive" );
    _id_A510::_id_0808( "human", "detach_cellphone", "com_cellphone_on", "tag_inhand", "carpassenger_fulldrive" );
    _id_A510::_id_0807( "human", "detach_cellphone", ::attach_phone_to_car, "carpassenger_fulldrive" );
    _id_A510::_id_0807( "human", "phone_ring", ::play_soz_ringtone, "carpassenger_fulldrive", "scn_coup_mobile_ring" );
    _id_A510::_id_0807( "human", "phone_dialog", ::play_soz_vo, "carpassenger_fulldrive", "coup_ab4_wehavetraitor" );
    _id_A510::_id_0807( "human", "turn_left", ::play_soz_vo, "carpassenger_fulldrive", "coup_ab4_turnlefthere" );
    _id_A510::_id_0807( "human", "turn_right", ::play_soz_vo, "carpassenger_fulldrive", "coup_ab4_rightatintersection" );
    _id_A510::_id_0807( "human", "answer_phone", ::play_soz_foley, "carpassenger_fulldrive", "scn_coup_car_soz_foley_02" );
    _id_A510::_id_0807( "human", "look_back_phone", ::play_soz_foley, "carpassenger_fulldrive", "scn_coup_car_soz_foley_03" );
    _id_A510::_id_0807( "human", "throws_phone", ::play_soz_foley, "carpassenger_fulldrive", "scn_coup_car_soz_foley_04" );
    _id_A510::_id_0807( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_gunup_fire" );
    _id_A510::_id_0807( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_gundown_fire_a" );
    _id_A510::_id_0807( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_gundown_fire_b" );
    _id_A510::_id_0807( "human", "fire_renamed", ::crowdfireweapon, "crowdmember_soldier_welcome_3" );
    _id_A510::_id_0807( "human", "soz_foley", ::passengerlookback, "intro_leftguard" );
    _id_A510::_id_0807( "human", "closing_door", ::ambientcarinterior, "intro_leftguard" );
    _id_A510::_id_0807( "human", "door_open", ::ambientcarexterior, "carexit_leftguard" );
    _id_A510::_id_0807( "human", "fire_gun", ::playerdeath, "ending_alasad" );
    _id_A510::_id_080C( "car", "civiliankilled_tumblesoncar", "drive_trashstumble" );
    _id_A510::_id_080C( "car", "civilians_running_to_garage", "drive_runtogarage" );
    _id_A510::_id_0807( "human", "fire", ::shootciviliantrashstumble, "civiliankilled_guard_a" );
    _id_A510::_id_0807( "human", "fire", ::shootciviliantrashstumble, "civiliankilled_guard_b" );
    _id_A510::_id_080C( "human", "spawn_operator", "spawn_garage_operator", "civilians_running_garage" );
    _id_A510::_id_080C( "human", "animate_operator", "animate_garage_operator", "civilians_running_garage" );
    _id_A510::_id_0807( "human", "fire", ::shootcivilianinterrogation1, "interrogation_guard_5b" );
}

play_soz_vo( var_0, var_1 )
{
    level.car.passenger._id_01E2 thread _id_A5A4::_id_69C4( var_1 );
}

play_soz_foley( var_0, var_1 )
{
    level.car.passenger.body thread _id_A5A4::_id_69C4( var_1 );
}

play_soz_ringtone( var_0, var_1 )
{
    level.car.passenger._id_67ED thread _id_A5A4::_id_69C4( var_1 );
}
#using_animtree("vehicles");

anim_vehicles()
{
    level._id_78B1["car"] = #animtree;
    level._id_78B5["car"] = "vehicle_luxurysedan_viewmodel";
    level._id_78AC["car"]["intro"] = %coup_opening_car;
    level._id_78AC["car"]["coup_car_driving"] = %coup_opening_car_driving;
    level._id_78AC["car"]["car_idle_normal"] = %coup_opening_car_driving_idle_normal;
    level._id_78AC["car"]["car_idle_smooth"] = %coup_opening_car_driving_idle_smooth;
    level._id_78AC["car"]["car_idle_bumpy"] = %coup_opening_car_driving_idle_bumpy;
    level._id_78AC["car"]["car_idle_static"] = %coup_opening_car_driving_idle_static;
    level._id_78AC["car"]["carexit"] = %coup_ending_drag_cardoor;
    _id_A510::_id_0805( "car", "coup_car_driving", "bump_front_01", "scn_coup_car_bump_front_01" );
    _id_A510::_id_0805( "car", "coup_car_driving", "big_turn_left_01", "scn_coup_car_turn_01" );
    _id_A510::_id_0805( "car", "coup_car_driving", "brake_civilian", "scn_coup_car_brake_01" );
    _id_A510::_id_0805( "car", "coup_car_driving", "big_turn_left_02", "scn_coup_car_turn_02" );
    _id_A510::_id_0805( "car", "coup_car_driving", "suspension_rattle_01", "scn_coup_car_suspension_rattle_front_01" );
    _id_A510::_id_0805( "car", "coup_car_driving", "big_turn_left_03", "scn_coup_car_turn_02" );
    _id_A510::_id_0805( "car", "coup_car_driving", "brake_end", "scn_coup_car_brake_02" );
    _id_A510::_id_0807( "car", "start_ride", ::play_engine, "coup_car_driving", "01" );
    _id_A510::_id_0807( "car", "start_ride", ::car_event, "coup_car_driving", "start_ride" );
    _id_A510::_id_0807( "car", "restart_ride", ::play_engine, "coup_car_driving", "02" );
    _id_A510::_id_0807( "car", "big_turn_left_01", ::car_event, "coup_car_driving", "big_turn_left_01" );
    _id_A510::_id_0807( "car", "brake_civilian", ::car_event, "coup_car_driving", "brake_civilian" );
    _id_A510::_id_0807( "car", "big_turn_left_02", ::car_event, "coup_car_driving", "big_turn_left_02" );
    _id_A510::_id_0807( "car", "big_turn_left_03", ::car_event, "coup_car_driving", "big_turn_left_03" );
    _id_A510::_id_0807( "car", "slowdown", ::car_event, "coup_car_driving", "slowdown" );
    level._id_78AC["car"]["wheel_bigleft2center"] = %coup_driver_bigleft2center_car;
    level._id_78AC["car"]["wheel_bigleft_idle"] = %coup_driver_bigleft_idle_car;
    level._id_78AC["car"]["wheel_bigleftloop_idle"] = %coup_driver_bigleftloop_idle_car;
    level._id_78AC["car"]["wheel_bigleftloop"] = %coup_driver_bigleft_loop_car;
    level._id_78AC["car"]["wheel_bigleftloop2center"] = %coup_driver_bigleftloop2center_car;
    level._id_78AC["car"]["wheel_center2smallleft"] = %coup_driver_center2smallleft_car;
    level._id_78AC["car"]["wheel_center2smallright"] = %coup_driver_center2smallright_car;
    level._id_78AC["car"]["wheel_idle"] = %coup_driver_idle_car;
    level._id_78AC["car"]["wheel_smallleft2bigleft"] = %coup_driver_smallleft2bigleft_car;
    level._id_78AC["car"]["wheel_smallleft2center"] = %coup_driver_smallleft2center_car;
    level._id_78AC["car"]["wheel_smallleft_idle"] = %coup_driver_smallleft_idle_car;
    level._id_78AC["car"]["wheel_smallright2center"] = %coup_driver_smallright2center_car;
    level._id_78AC["car"]["wheel_smallright_idle"] = %coup_driver_smallright_idle_car;
    level._id_78B1["uaz"] = #animtree;
    level._id_78AC["uaz"]["carjack_driver_door"] = %ac130_carjack_door_1a;
    level._id_78AC["uaz"]["carjack_others_door"] = %ac130_carjack_door_others;
}

play_engine( var_0, var_1 )
{
    level.car_move_engine_sound_node thread maps\coup_aud::aud_play_engine( var_0, var_1 );
}

car_event( var_0, var_1 )
{
    switch ( var_1 )
    {
        case "start_ride":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.65, 0, 0, 1, 2, undefined );
            break;
        case "big_turn_left_01":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.75, 2, 1, 0.94, 2, "first_turn_mix" );
            break;
        case "brake_civilian":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.71, 1, 0.6, 1, 1, "brake_civilian_mix" );
            level.car_move_engine_sound_node thread maps\coup_aud::aud_stop_engine( "01", 1 );
            break;
        case "big_turn_left_02":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.71, 2, 1.5, 0.94, 1, "second_turn_mix" );
            break;
        case "big_turn_left_03":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.63, 2, 2, 1, 1.5, "third_turn_mix" );
            break;
        case "slowdown":
            level.car_move_engine_sound_node thread maps\coup_aud::aud_car_event_handler( 0.79, 2, 1, 0.79, 0, "stop_car_mix" );
            break;
    }
}
#using_animtree("door");

anim_door()
{
    level._id_78B1["door"] = #animtree;
    level._id_78AC["door"]["doorkick"] = %shotgunbreach_door_immediate;
    level._id_78B5["door"] = "com_door_01_handleright";
}
#using_animtree("trash_can");

anim_trashcan()
{
    level._id_78B1["trashcan_rig"] = #animtree;
    level._id_78B5["trashcan_rig"] = "prop_rig";
}
#using_animtree("script_model");

anim_dumpster()
{
    level._id_78B1["dumpster"] = #animtree;
    level._id_78AC["dumpster"]["dumpster_open"] = %coup_dumpster_lid;
}
#using_animtree("animated_props");

_id_0BEE()
{
    level._id_0BEC["foliage_tree_palm_bushy_2"]["still"] = %palmtree_bushy2_still;
    level._id_0BEC["foliage_tree_palm_bushy_2"]["strong"] = %palmtree_bushy2_sway;
    level._id_0BEC["foliage_tree_palm_bushy_2"]["heli"] = %palmtree_bushy2_sway;
    level._id_0BEC["foliage_tree_palm_bushy_1"]["still"] = %palmtree_bushy1_still;
    level._id_0BEC["foliage_tree_palm_bushy_1"]["strong"] = %palmtree_bushy1_sway;
    level._id_0BEC["foliage_tree_palm_bushy_1"]["heli"] = %palmtree_bushy1_sway;
    level._id_0BEC["foliage_tree_palm_bushy_3"]["still"] = %palmtree_bushy3_still;
    level._id_0BEC["foliage_tree_palm_bushy_3"]["strong"] = %palmtree_bushy3_sway;
    level._id_0BEC["foliage_tree_palm_bushy_3"]["heli"] = %palmtree_bushy3_sway;
    level._id_0BEC["foliage_tree_palm_med_2"]["still"] = %palmtree_med2_still;
    level._id_0BEC["foliage_tree_palm_med_2"]["strong"] = %palmtree_med2_sway;
    level._id_0BEC["foliage_tree_palm_med_2"]["heli"] = %palmtree_med2_sway;
    level._id_0BEC["foliage_tree_palm_med_1"]["still"] = %palmtree_med1_still;
    level._id_0BEC["foliage_tree_palm_med_1"]["strong"] = %palmtree_med1_sway;
    level._id_0BEC["foliage_tree_palm_med_1"]["heli"] = %palmtree_med1_sway;
    level._id_0BEC["foliage_tree_palm_tall_1"]["still"] = %palmtree_tall1_still;
    level._id_0BEC["foliage_tree_palm_tall_1"]["strong"] = %palmtree_tall1_sway;
    level._id_0BEC["foliage_tree_palm_tall_1"]["heli"] = %palmtree_tall1_sway;
    level._id_0BEC["foliage_tree_palm_tall_3"]["still"] = %palmtree_tall3_still;
    level._id_0BEC["foliage_tree_palm_tall_3"]["strong"] = %palmtree_tall3_sway;
    level._id_0BEC["foliage_tree_palm_tall_3"]["heli"] = %palmtree_tall3_sway;
    level._id_0BEC["foliage_tree_palm_tall_2"]["still"] = %palmtree_tall2_still;
    level._id_0BEC["foliage_tree_palm_tall_2"]["strong"] = %palmtree_tall2_sway;
    level._id_0BEC["foliage_tree_palm_tall_2"]["heli"] = %palmtree_tall2_sway;
    level._id_0BEC["foliage_afr_tree_fanpalm_01a"]["still"] = %afr_tree_fanpalm_still;
    level._id_0BEC["foliage_afr_tree_fanpalm_01a"]["strong"] = %afr_tree_fanpalm_sway;
    level._id_0BEC["foliage_afr_tree_fanpalm_01a"]["heli"] = %afr_tree_fanpalm_sway;
    level._id_0BEC["foliage_afr_tree_fanpalm_01a_v2"]["still"] = %afr_tree_fanpalm_still;
    level._id_0BEC["foliage_afr_tree_fanpalm_01a_v2"]["strong"] = %afr_tree_fanpalm_sway;
    level._id_0BEC["foliage_afr_tree_fanpalm_01a_v2"]["heli"] = %afr_tree_fanpalm_sway;
    level._id_78B1["rope_hands"] = #animtree;
    level._id_78B5["rope_hands"] = "h1_president_rope";
    level._id_78AC["rope_hands"]["intro_ropehands"] = %h1_coup_president_rope_opening;
    level._id_78AC["rope_hands"]["car_idle_fullbody_ropehands"] = %h1_coup_president_rope;
    level._id_78AC["rope_hands"]["carexit_ropehands"] = %h1_coup_president_rope_ending;
}
#using_animtree("animals");

anim_chickens()
{
    level._id_78B1["chicken"] = #animtree;
    level._id_78B5["chicken"] = "chicken";
    level._id_78AC["chicken"]["walk_basic"] = %chicken_walk_basic;
    level._id_78AC["chicken"]["cage_freakout"] = %chicken_cage_freakout;
}
#using_animtree("dog");

anim_dogs()
{
    level._id_78B1["dog"] = #animtree;
    level._id_78AC["dog"]["idle"] = %german_shepherd_idle;
    level._id_78AC["dog"]["walk"] = %german_shepherd_walk;
    level._id_78AC["dog"]["eating"][0] = %german_shepherd_eating_loop;
    level._id_78AC["dog"]["sleeping"][0] = %german_shepherd_sleeping;
    level._id_78AC["dog"]["wakeup_slow"] = %german_shepherd_wakeup_slow;
    level._id_78AC["dog"]["wakeup_fast"] = %german_shepherd_wakeup_fast;
    level._id_78AC["dog"]["fence_attack"] = %sniper_escape_dog_fence;
    level._id_78AC["dog"]["attackidle_growl"][0] = %german_shepherd_attackidle_growl;
    level._id_78AC["dog"]["attackidle_bark"][0] = %german_shepherd_attackidle_bark;
    level._id_78AC["dog"]["attackidle"][0] = %german_shepherd_attackidle;
    _id_A510::_id_0812( "dog", "fence", "fence_attack", "fence_smash" );
}

car_normal( var_0 )
{
    var_0 _meth_8145( var_0 _id_A5A4::_id_3EF5( "car_idle_normal" ), 1, 0, 1 );
    var_0.playerview _meth_8145( var_0.playerview _id_A5A4::_id_3EF5( "playerview_idle_normal" ), 1, 0, 1 );
}

car_smooth( var_0 )
{
    var_0 _meth_8145( var_0 _id_A5A4::_id_3EF5( "car_idle_smooth" ), 1, 0, 1 );
    var_0.playerview _meth_8145( var_0.playerview _id_A5A4::_id_3EF5( "playerview_idle_smooth" ), 1, 0, 1 );
}

car_bumpy( var_0 )
{
    var_0 _meth_8145( var_0 _id_A5A4::_id_3EF5( "car_idle_bumpy" ), 1, 0, 1 );
    var_0.playerview _meth_8145( var_0.playerview _id_A5A4::_id_3EF5( "playerview_idle_bumpy" ), 1, 0, 1 );
}

car_static( var_0 )
{
    var_0 _meth_8145( var_0 _id_A5A4::_id_3EF5( "car_idle_static" ), 1, 0, 1 );
    var_0.playerview _meth_8145( var_0.playerview _id_A5A4::_id_3EF5( "playerview_idle_static" ), 1, 0, 1 );
}

driver_turnright1( var_0 )
{
    printturnanim( " --- STARTED  turnright1" );
    var_0 playdriveranim( "center2smallright", "turnright1" );
    var_0 loopdriveranim( "smallright_idle", "turnright1", "return" );
    var_0 playdriveranim( "smallright2center", "turnright1" );
    var_0 loopdriveranim( "idle", "turnright1" );
    printturnanim( " --- FINISHED turnright1" );
}

driver_turnleft1( var_0 )
{
    printturnanim( " --- STARTED  turnleft1" );
    var_0 playdriveranim( "center2smallleft", "turnleft1" );
    var_0 loopdriveranim( "smallleft_idle", "turnleft1", "return" );
    var_0 playdriveranim( "smallleft2center", "turnleft1" );
    var_0 loopdriveranim( "idle", "turnleft1" );
    printturnanim( " --- FINISHED turnleft1" );
}

driver_turnleft2( var_0 )
{
    printturnanim( " --- STARTED  turnleft2" );
    var_0 playdriveranim( "center2smallleft", "turnleft2" );
    var_0 playdriveranim( "smallleft2bigleft", "turnleft2" );
    var_0 loopdriveranim( "bigleft_idle", "turnleft2", "return" );
    var_0 playdriveranim( "bigleft2center", "turnleft2" );
    var_0 loopdriveranim( "idle", "turnleft2" );
    printturnanim( " --- FINISHED turnleft2" );
}

driver_turnleft3( var_0 )
{
    printturnanim( " --- STARTED  turnleft3" );
    var_0 playdriveranim( "center2smallleft", "turnleft3" );
    var_0 playdriveranim( "smallleft2bigleft", "turnleft3" );
    var_0 playdriveranim( "bigleftloop", "turnleft3" );
    var_0 loopdriveranim( "bigleft_idle", "turnleft3", "return" );
    var_0 playdriveranim( "bigleft2center", "turnleft3" );
    var_0 loopdriveranim( "idle", "turnleft3" );
    printturnanim( " --- FINISHED turnleft3" );
}

driver_turnspecial( var_0 )
{
    printturnanim( " --- STARTED  turnspecial" );
    var_0 playdriveranim( "center2smallleft", "turnspecial" );
    var_0 loopdriveranim( "smallleft_idle", "turnspecial", "turnleft_2_special" );
    var_0 playdriveranim( "smallleft2bigleft", "turnspecial" );
    var_0 loopdriveranim( "bigleft_idle", "turnspecial", "return" );
    var_0 playdriveranim( "bigleft2center", "turnspecial" );
    var_0 loopdriveranim( "idle", "turnspecial" );
    printturnanim( " --- FINISHED turnspecial" );
}

playerdeath( var_0 )
{
    playfxontag( common_scripts\utility::_id_3FA8( "execution_muzzleflash" ), var_0, "tag_flash" );
    playfxontag( common_scripts\utility::_id_3FA8( "execution_shell_eject" ), var_0, "tag_brass" );
    level._id_0318 _meth_80AF( "grenade_rumble" );
    level._id_0318 thread _id_A5A4::_id_69C4( "assassination_shot" );
    wait 0.1;
    var_1 = _func_1A9();
    var_1._id_0530 = 0;
    var_1._id_0538 = 0;
    var_1 _meth_80CE( "black", 640, 480 );
    var_1.alignx = "left";
    var_1.aligny = "top";
    var_1._id_01F3 = "fullscreen";
    var_1._id_0501 = "fullscreen";
    var_1.alpha = 1;
    var_1._id_03D4 = 1;
    level notify( "player_death" );
    level._id_0318 _meth_8186( "coup_death", 10 );
    _id_A5E8::_id_870C( "start_coup_player_death_mix" );
    wait 4.5;
    _id_A5A4::_id_60D6();
}

playerthrownincar( var_0 )
{
    wait 0.3;
    _id_A5E8::_id_870C( "aud_coup_car_open" );
    wait 0.25;
    level._id_0318 _meth_80AF( "grenade_rumble" );
    wait 1.8;
    level.leftguard _id_A5A4::_id_69C4( "coup_ab0_move_generic_custom" );
}

playerhit( var_0 )
{
    wait 0.15;
    _id_A5E8::_id_870C( "aud_add_stunned_car_event" );
    level._id_0318 _meth_80AF( "grenade_rumble" );
    _func_074( 40, 0.1 );
    _id_A5A4::_id_7F00( "coup_hit", 0 );
    _func_0D6( "r_glow_allowed_script_forced", "0" );
    wait 0.1;
    _id_A5A4::_id_7F00( "coup_ride", 0.2 );
    _func_074( 0, 0.75 );
    thread _id_6C6A( 35.0, 25 );
    wait 5;
    _id_A5E8::_id_870C( "aud_stop_stunned_car_event" );
}

playerpulledfromcar( var_0 )
{
    wait 2.15;
    _id_A5E8::_id_870C( "aud_coup_car_thrown_out" );
    wait 2.0;
    level._id_0318 _meth_80AF( "grenade_rumble" );
}

playerkicked( var_0 )
{
    wait 0.65;
    level._id_0318 _meth_80AF( "grenade_rumble" );
}

playerhitdamage( var_0 )
{
    var_1 = level._id_0318._id_01E6 * 0.1;
    var_2 = level._id_0318._id_01E6 - var_1;
    var_3 = var_2 / getdvarfloat( "player_damageMultiplier" );
    level._id_0318 _meth_8053( var_3, level._id_0318._id_02E2 );
}

_id_6C6A( var_0, var_1 )
{
    wait 2;

    for (;;)
    {
        wait 0.2;

        if ( var_1 <= 0 )
            return;

        var_2 = var_1 / var_0;

        if ( var_2 > level._id_0318._id_4441._id_478D )
            continue;

        level._id_0318 _id_A5A4::_id_69C4( "breathing_hurt" );
        wait(0.1 + _func_0B3( 0.8 ));
    }
}

melee_kill( var_0 )
{
    var_0 _meth_809C( "melee_swing_large" );
    var_0._id_0179 _meth_809C( "melee_hit" );
    var_0._id_0179.allowdeath = 0;
    var_0._id_0179 notify( "anim_death" );
    thread kill_self( var_0._id_0179 );
}

rag_doll_death( var_0 )
{
    var_0 thread killed_by_player( 1 );
}

kill_self( var_0 )
{
    var_0 endon( "death" );
    wait 0.1;
    var_0.allowdeath = 1;
    var_0 _meth_8054();
}

killed_by_player( var_0 )
{
    self endon( "anim_death" );
    self notify( "killed_by_player_func" );
    self endon( "killed_by_player_func" );

    for (;;)
    {
        self waittill( "death", var_1 );

        if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
            break;
    }

    self notify( "killed_by_player" );

    if ( isdefined( var_0 ) )
    {
        animscripts\shared::_id_2F6C();
        self _meth_8023();
    }
}

playdriveranim( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printturnanim( " ---          " + var_1 + ", " + var_0 );
    else
        printturnanim( " ---          , " + var_0 );

    if ( var_0 == "bigleft2center" && var_1 == "turnleft3" )
        self _meth_8145( _id_A5A4::_id_3EF5( "wheel_bigleftloop2center" ), 1, 0, 1 );
    else
        self _meth_8145( _id_A5A4::_id_3EF5( "wheel_" + var_0 ), 1, 0, 1 );

    _id_A510::_id_0C24( self._id_2E04, "cardriver_" + var_0, "tag_driver" );
}

loopdriveranim( var_0, var_1, var_2 )
{
    if ( isdefined( var_1 ) )
        printturnanim( " --- ( loop ) " + var_1 + ", " + var_0 );
    else
        printturnanim( " --- ( loop ) , " + var_0 );

    self notify( "stop_driver_loop" );

    if ( var_0 == "bigleft_idle" && var_1 == "turnleft3" )
        self _meth_8145( _id_A5A4::_id_3EF5( "wheel_bigleftloop_idle" ), 1, 0, 1 );
    else
        self _meth_8145( _id_A5A4::_id_3EF5( "wheel_" + var_0 ), 1, 0, 1 );

    thread _id_A510::_id_0BE1( self._id_2E04, "cardriver_" + var_0, "tag_driver", "stop_driver_loop" );

    if ( isdefined( var_2 ) )
    {
        self waittillmatch( "single anim", var_2 );
        printturnanim( " --- MATCHED  " + var_1 + ", " + var_0 + ", " + var_2 );
    }
}

playpassengeranim( var_0 )
{
    _id_A510::_id_0C24( self.passenger, var_0, "tag_passenger" );
}

looppassengeranim( var_0, var_1 )
{
    self notify( "stop_passenger_loop" );
    thread _id_A510::_id_0BE1( self.passenger, var_0, "tag_passenger", "stop_passenger_loop" );

    if ( isdefined( var_1 ) )
        self waittillmatch( "single anim", var_1 );
}

printturnanim( var_0 )
{
    if ( isdefined( level.debug_turnanims ) && level.debug_turnanims )
        return;
}

printpassengeranim( var_0 )
{
    if ( isdefined( level.debug_passengeranims ) && level.debug_passengeranims )
        return;
}

ambientcarinterior( var_0 )
{
    wait 0.6;
    _id_A5E8::_id_870C( "aud_coup_enter_car" );
}

ambientcarexterior( var_0 )
{
    wait 0.1;
    _id_A5E8::_id_870C( "aud_coup_exit_car" );
}

passengerlookback( var_0 )
{
    wait 2.5;
    level.car.passenger.body thread _id_A5A4::_id_69C4( "scn_coup_car_soz_foley_01" );
}

crowdfireweapon( var_0 )
{
    var_0 thread _id_A5A4::_id_69C5( "weap_ak47_fire_npc", "tag_flash" );
    playfxontag( common_scripts\utility::_id_3FA8( "ak47_muzzleflash" ), var_0, "tag_flash" );
}

shootciviliantrashstumble( var_0 )
{
    _func_1C2( var_0._id_0513, var_0 _meth_8184( "tag_flash" ), level.runner _meth_80AA() );
}

shootcivilianinterrogation1( var_0 )
{
    _func_1C2( var_0._id_0513, var_0 _meth_8184( "tag_flash" ), level.suspect_5b _meth_8184( "tag_stowed_back" ) );
}

shootcivilianexecution( var_0 )
{
    var_1 = common_scripts\utility::_id_3DF3( "target_" + var_0._id_04A4 );

    for ( var_2 = 0; var_2 < 6; var_2++ )
    {
        _func_1C2( var_0._id_0513, var_0 _meth_8184( "tag_flash" ), var_1._id_02E2 );
        wait(_func_0B5( 0.1, 0.3 ));
    }
}

fx_paint_spray_coup( var_0 )
{
    playfxontag( common_scripts\utility::_id_3FA8( "paint_spray_coup" ), var_0, "tag_spraycan_fx" );
}

fx_stop_paint_spray_coup( var_0 )
{
    stopfxontag( common_scripts\utility::_id_3FA8( "paint_spray_coup" ), var_0, "tag_spraycan_fx" );
}

detach_paint_spray_coup( var_0 )
{
    var_0 _meth_802A( "com_spray_can01", "tag_inhand" );
}

attach_phone_to_car( var_0 )
{
    level.car _meth_801D( "com_cellphone_on", "tag_cellphone" );
    common_scripts\utility::_id_384A( "start_dragged_aftercarexit" );
    level.car _meth_802A( "com_cellphone_on", "tag_cellphone" );
}

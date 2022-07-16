// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    _id_4B03();
    _id_2CD8();
}
#using_animtree("generic_human");

_id_4B03()
{
    level._id_78AC["generic"]["patrol_turn180"] = %patrol_bored_2_walk_180turn;
    level._id_78AC["generic"]["_stealth_patrol_jog"] = %patrol_jog;
    level._id_78AC["generic"]["_stealth_patrol_walk"] = %patrol_bored_patrolwalk;
    level._id_78AC["generic"]["_stealth_combat_jog"] = %combat_jog;
    level._id_78AC["generic"]["_stealth_patrol_search_a"] = %patrol_boredwalk_lookcycle_a;
    level._id_78AC["generic"]["_stealth_patrol_search_b"] = %patrol_boredwalk_lookcycle_b;
    level._id_78AC["generic"]["_stealth_behavior_whizby_0"] = %exposed_idle_reacta;
    level._id_78AC["generic"]["_stealth_behavior_whizby_1"] = %exposed_idle_reactb;
    level._id_78AC["generic"]["_stealth_behavior_whizby_2"] = %exposed_idle_twitch;
    level._id_78AC["generic"]["_stealth_behavior_whizby_3"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_whizby_4"] = %run_pain_stumble;
    level._id_78AC["generic"]["_stealth_behavior_spotted_short"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_spotted_long"] = %patrol_bored_react_walkstop_short;
    level._id_78AC["generic"]["_stealth_look_around"][0] = %patrol_bored_react_look_v1;
    level._id_78AC["generic"]["_stealth_look_around"][1] = %patrol_bored_react_look_v2;
    level._id_78AC["generic"]["_stealth_behavior_saw_corpse"] = %exposed_idle_twitch_v4;
    level._id_78AC["generic"]["_stealth_behavior_generic1"] = %patrol_bored_react_look_advance;
    level._id_78AC["generic"]["_stealth_behavior_generic2"] = %patrol_bored_react_look_retreat;
    level._id_78AC["generic"]["_stealth_behavior_generic3"] = %patrol_bored_react_walkstop;
    level._id_78AC["generic"]["_stealth_behavior_generic4"] = %patrol_bored_react_walkstop_short;
    level._id_78AC["generic"]["_stealth_find_walk"] = %patrol_boredwalk_find;
    level._id_78AC["generic"]["_stealth_find_jog"] = %patrol_boredjog_find;
    level._id_78AC["generic"]["_stealth_find_run"] = %patrol_boredrun_find;
}
#using_animtree("dog");

_id_2CD8()
{
    level._id_78AC["generic"]["_stealth_dog_sleeping"][0] = %german_shepherd_sleeping;
    level._id_78AC["generic"]["_stealth_dog_wakeup_fast"] = %german_shepherd_wakeup_fast;
    level._id_78AC["generic"]["_stealth_dog_wakeup_slow"] = %german_shepherd_wakeup_slow;
}

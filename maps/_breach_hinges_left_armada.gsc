// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    level.door_objmodel = "com_door_breach_left_obj";
    precachemodel( level.door_objmodel );
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_start_01"] = %breach_sh_breacherl1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_start_02"] = %breach_sh_stackr1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_idle_01"][0] = %breach_sh_breacherl1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_idle_02"][0] = %breach_sh_stackr1_idle;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_breach_01"] = %h1_armada_03_shotgunhinges_soldiera;
    level._id_78AC["generic"]["shotgunhinges_breach_left_stack_breach_02"] = %h1_armada_03_shotgunhinges_soldierb;
    _id_A510::_id_0807( "generic", "custom_audio_fire", ::custom_audio_fire, "shotgunhinges_breach_left_stack_breach_01" );
}

custom_audio_fire( var_0 )
{
    var_0 thread _id_A5A4::_id_69C4( "armada_doorbreach_scripted_gun" );
}

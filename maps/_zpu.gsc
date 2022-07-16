// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main( var_0 )
{
    var_1 = getentarray( "zpu", "targetname" );
    var_2 = [];

    for ( var_3 = 0; var_3 < var_1.size; var_3++ )
        var_2[var_3] = var_1[var_3]._id_79D3;

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = var_2.size - 1;

        for ( var_6 = var_4; var_6 < var_5; var_6++ )
            waitframe;
    }

    precacherumble( "zpu_rumble" );
    load_zpu_anims();
    load_zpugunner_anims();
    common_scripts\utility::_id_0D13( var_1, ::per_zpu_init );
    level.zpu_fx = loadfx( "fx/muzzleflashes/zpu_flash_wv" );
}

per_zpu_init()
{
    self endon( "death" );
    var_0 = getentarray( self._id_04A4, "targetname" );
    var_1 = [];
    common_scripts\utility::_id_383D( self._id_79D3 );
    var_2 = undefined;
    var_3 = undefined;
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_0.size; var_5++ )
    {
        var_6 = var_0[var_5];

        if ( _func_120( var_6.classname, "actor" ) )
        {
            var_2 = var_6;
            continue;
        }

        if ( isdefined( var_6._id_0398 ) && var_6._id_0398 == "dismount" )
        {
            var_3 = var_6;
            continue;
        }

        if ( isdefined( var_6._id_0398 ) && var_6._id_0398 == "kill_zpu_spawner" )
        {
            var_7 = var_6;
            var_7 thread zpu_cancel( self._id_79D3 );
            continue;
        }

        var_1[var_1.size] = var_6;

        if ( _func_120( var_6.classname, "trigger_" ) )
            var_4 = 1;
    }

    if ( var_4 )
        waittill_trigger_array( var_1 );

    for (;;)
    {
        if ( var_2.count > 0 )
        {
            var_8 = var_2 spawn_gunner();
            var_8 _meth_804F( self, "tag_driver", ( 0, 0, 0 ), ( 0, 0, 0 ) );
            var_8 thread zpugunner_animation_think( self );
            var_8 thread monitor_gunner( self );
            var_8 thread gunner_death_think( self );

            if ( isdefined( var_3 ) )
            {
                waittill_death_or_dismount( var_3, var_8, self );
                zpu_recycle( self._id_79D3 );

                if ( common_scripts\utility::_id_382E( self._id_79D3 ) )
                    break;
                else
                    var_2.count = 1;
            }
        }
        else
            break;

        wait 0.1;
    }
}

zpu_cancel( var_0 )
{
    self waittill( "trigger" );
    common_scripts\utility::_id_383F( var_0 );
    level notify( var_0 );
}

zpu_recycle( var_0 )
{
    level endon( var_0 );
    wait 20;
}

waittill_death_or_dismount( var_0, var_1, var_2 )
{
    var_1 endon( "death" );
    var_1 endon( "damage" );
    var_0 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "trigger" );
    var_1 _id_A5A4::_id_07BE( _id_A5A4::_id_A099, "doFlashBanged" );
    var_1 _id_A5A4::_id_075B( "death" );
    _id_A5A4::_id_2BDD();
    var_1 waittillmatch( "looping anim", "end" );
    var_2 notify( "stop_looping" );
    var_1 thread zpugunner_dismount( var_2 );
}

monitor_gunner( var_0 )
{
    self waittill( "death" );
    var_0 _meth_814D( level._id_78AC[var_0._id_0C72]["fire_loop"][0], 1, 1, 0 );
    var_0 _meth_814D( level._id_78AC[var_0._id_0C72]["fire_loop"][1], 1, 1, 0 );
}

gunner_death_think( var_0 )
{
    self._id_01E6 = 5000;
    self endon( "dismount" );
    self waittill( "damage" );

    if ( !isdefined( self ) )
        return;

    self notify( "dying_damage" );
    self.a._id_612E = 1;
    self._id_2652 = level._id_78AC["zpu_gunner"]["deathslouch"];
    var_0 thread _id_A510::_id_0C24( self, "deathslouch", "tag_driver" );
    wait 0.5;
    _id_A5A4::_id_2A51();
}

spawn_gunner()
{
    var_0 = _id_A5A4::_id_88C3();

    if ( _id_A5A4::_id_88F1( var_0 ) )
        return;

    var_0 endon( "death" );
    var_0.allowdeath = 1;
    return var_0;
}

waittill_trigger_array( var_0 )
{
    for ( var_1 = 1; var_1 < var_0.size; var_1++ )
        var_0[var_1] endon( "trigger" );

    var_0[0] waittill( "trigger" );
}
#using_animtree("zpu");

load_zpu_anims()
{
    level._id_78B1["zpu_gun"] = #animtree;
    level._id_78AC["zpu_gun"]["fire_loop"][0] = %zpu_gun_fire_a;
    level._id_78AC["zpu_gun"]["fire_loop"][1] = %zpu_gun_fire_b;
    _id_A510::_id_0807( "zpu_gun", "fire_1", ::zpu_shoot1 );
    _id_A510::_id_0807( "zpu_gun", "fire_2", ::zpu_shoot2 );
}
#using_animtree("generic_human");

load_zpugunner_anims()
{
    level._id_78AC["zpu_gunner"]["deathslouch"] = %zpu_gunner_deathslouch;
    level._id_78AC["zpu_gunner"]["deathslouchidle"] = %zpu_gunner_deathslouchidle;
    level._id_78AC["zpu_gunner"]["dismount"] = %zpu_gunner_dismount;
    level._id_78AC["zpu_gunner"]["fire_loop"][0] = %zpu_gunner_fire_a;
    level._id_78AC["zpu_gunner"]["fire_loop"][1] = %zpu_gunner_fire_b;
}

zpu_shoot1( var_0 )
{
    playfxontag( level.zpu_fx, var_0, "tag_flash" );
    playfxontag( level.zpu_fx, var_0, "tag_flash2" );
    var_0 _meth_809C( "zpu_fire1" );
    _func_1C7( "zpu_rumble", self._id_02E2 );
}

zpu_shoot2( var_0 )
{
    playfxontag( level.zpu_fx, var_0, "tag_flash1" );
    playfxontag( level.zpu_fx, var_0, "tag_flash3" );
    var_0 _meth_809C( "zpu_fire2" );
    _func_1C7( "zpu_rumble", self._id_02E2 );
}

zpugunner_animation_think( var_0 )
{
    self endon( "death" );
    self endon( "dismount gunner" );
    var_0 endon( "dismount gunner" );
    var_0 endon( "new gunner" );
    self._id_0C72 = "zpu_gunner";
    var_0._id_0C72 = "zpu_gun";
    var_0 _id_A5A4::_id_0D61();
    var_1 = [];
    var_1[var_1.size] = _id_A510::_id_0BAB( var_0, "tag_driver" );
    var_1[var_1.size] = var_0 _id_A510::_id_0BAC();
    var_0 thread _id_A510::_id_0BDF( var_1, "fire_loop", "stop_looping" );
}

zpugunner_dismount( var_0 )
{
    self endon( "death" );
    self endon( "dying_damage" );
    self._id_0C72 = "zpu_gunner";
    var_0._id_0C72 = "zpu_gun";
    var_0 _id_A5A4::_id_0D61();
    var_0 thread _id_A510::_id_0C24( self, "dismount", "tag_driver" );
    wait 0.8;
    self._id_01E6 = 100;
    self notify( "dismount" );
    self._id_2652 = undefined;
    self _meth_8051();
}

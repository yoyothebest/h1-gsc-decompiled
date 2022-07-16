// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_35F7( var_0, var_1, var_2 )
{
    self _meth_8086( var_0 );
    self.alpha = var_1;
    _func_074( var_2, var_0 );
    wait(var_0);
}

_id_148C( var_0, var_1 )
{
    _id_35F7( var_0, 1, var_1 );
}

_id_74B2( var_0, var_1 )
{
    _id_35F7( var_0, 0, var_1 );
}

initdof()
{
    _func_0D6( "scr_dof_enable", 0 );

    for (;;)
    {
        setdefaultdepthoffield();
        wait 0.05;
    }
}

setdefaultdepthoffield()
{
    level._id_0318 _meth_818A( level._id_2C7B["nearStart"], level._id_2C7B["nearEnd"], level._id_2C7B["farStart"], level._id_2C7B["farEnd"], level._id_2C7B["nearBlur"], level._id_2C7B["farBlur"] );
}

_id_7F54( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_6 ) && var_6 > 0 )
    {
        var_6 = _func_0BC( var_6 * 1000 );
        var_7 = gettime();

        for ( var_8 = gettime(); var_8 <= var_7 + var_6; var_8 = gettime() )
        {
            var_9 = ( var_8 - var_7 ) / var_6;
            lerpdofvalue( "nearStart", var_0, var_9 );
            lerpdofvalue( "nearEnd", var_1, var_9 );
            lerpdofvalue( "nearBlur", var_2, var_9 );
            lerpdofvalue( "farStart", var_3, var_9 );
            lerpdofvalue( "farEnd", var_4, var_9 );
            lerpdofvalue( "farBlur", var_5, var_9 );
            wait 0.05;
        }
    }

    self._id_2C3D["nearStart"] = var_0;
    self._id_2C3D["nearEnd"] = var_1;
    self._id_2C3D["nearBlur"] = var_2;
    self._id_2C3D["farStart"] = var_3;
    self._id_2C3D["farEnd"] = var_4;
    self._id_2C3D["farBlur"] = var_5;
}

lerpdofvalue( var_0, var_1, var_2 )
{
    level._id_2C7B[var_0] = self._id_2C3D[var_0] + ( var_1 - self._id_2C3D[var_0] ) * var_2;
}

scripted_array_spawn( var_0, var_1, var_2 )
{
    var_3 = getentarray( var_0, var_1 );
    var_4 = [];

    for ( var_5 = 0; var_5 < var_3.size; var_5++ )
        var_4[var_5] = scripted_spawn2( var_0, var_1, var_2, var_3[var_5] );

    return var_4;
}

scripted_spawn2( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( var_3 ) )
        var_3 = getent( var_0, var_1 );

    if ( isdefined( var_3._id_79AD ) )
    {
        var_4 = _id_A5A4::_id_2F29( var_3, 1 );

        if ( var_3.classname == "actor_enemy_arab_AR_ak47" )
        {
            if ( var_3._id_04A6 == "carexit_rightguard" )
                var_4 setcurbstompcharacter();
            else
                var_4 randomizeguardcharacter();
        }

        return var_4;
    }
    else
    {
        if ( isdefined( var_2 ) )
            var_5 = var_3 _meth_8096();
        else
            var_5 = var_3 _meth_8095();

        _id_A5A4::_id_88F1( var_5 );
        return var_5;
    }
}

deletecharactertriggers()
{
    var_0 = getentarray( "deleteai", "targetname" );

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2._id_7993 ) )
            var_2 thread deletecharacter();
    }
}

deletecharacter()
{
    self waittill( "trigger" );
    var_0 = _func_0D9();

    for ( var_1 = 0; var_1 < var_0.size; var_1++ )
    {
        var_2 = var_0[var_1];

        if ( isdefined( var_2._id_7993 ) && var_2._id_7993 == self._id_7993 )
            var_2 delete();
    }

    var_3[0] = "axis";
    var_3[1] = "allies";
    var_3[2] = "neutral";

    for ( var_1 = 0; var_1 < var_3.size; var_1++ )
    {
        var_4 = level._id_2F1A[var_3[var_1]]._id_0CD8;

        for ( var_5 = 0; var_5 < var_4.size; var_5++ )
        {
            var_6 = var_4[var_5];

            if ( isdefined( var_6._id_7993 ) && var_6._id_7993 == self._id_7993 )
                var_6 delete();
        }
    }
}

pulsefadevision( var_0, var_1 )
{
    level._id_0318 endon( "death" );
    level.vision_totalpercent = 100;
    thread updatepulsefadeamount( var_0, var_1 );
    var_2 = _func_1A9();
    var_2._id_0530 = 0;
    var_2._id_0538 = 0;
    var_2 _meth_80CE( "black", 640, 480 );
    var_2.alignx = "left";
    var_2.aligny = "top";
    var_2._id_01F3 = "fullscreen";
    var_2._id_0501 = "fullscreen";
    var_2.alpha = 0;
    var_3 = 1;
    var_4 = 4;
    var_5 = 0.25;
    var_6 = 1;
    var_7 = 0;
    var_8 = 100;
    var_9 = 0;

    for (;;)
    {
        while ( level.vision_totalpercent > var_7 )
        {
            var_10 = var_8 - var_7;
            var_9 = ( level.vision_totalpercent - var_7 ) / var_10;

            if ( var_9 < 0 )
                var_9 = 0;
            else if ( var_9 > 1 )
                var_9 = 1;

            var_11 = var_4 - var_3;
            var_12 = var_3 + var_11 * ( 1 - var_9 );
            var_13 = var_6 - var_5;
            var_14 = var_5 + var_13 * var_9;
            var_15 = 7.2 * var_14;
            var_16 = var_9 * 0.5;
            var_17 = 7.2 * var_16;
            var_0 = var_12 / 2;
            var_2 _id_35F7( var_0, var_14, var_15 );
            var_2 _id_35F7( var_0, var_16, var_17 );
            wait(var_9 * 0.5);
        }

        wait 0.05;
    }
}

updatepulsefadeamount( var_0, var_1 )
{
    var_2 = 0.05;
    var_3 = _func_0BC( var_0 / var_2 );

    while ( var_3 > 1 )
    {
        level.vision_totalpercent += ( var_1 - level.vision_totalpercent ) / var_3;
        var_3--;
        wait(var_2);
    }

    level.vision_totalpercent = var_1;
}

dropdead()
{
    self waittill( "death", var_0 );
    animscripts\shared::_id_2F6C();
    self _meth_8023();
    var_1 = self._id_02E2;
    var_1 += ( 0, 16, 0 );
    var_2 = anglestoforward( ( 0, 270, 0 ) );
    var_3 = _id_A5A4::vector_multiply( var_2, 2 );
    _func_180( var_1, 250, 250, var_3 );
}

deleteentity( var_0 )
{
    if ( isdefined( var_0 ) )
    {
        if ( isdefined( var_0._id_58D7 ) )
            var_0 _id_A5A4::_id_8EA4();

        var_0 delete();
    }
}

deleteongoal()
{
    self waittill( "goal" );
    deleteentity( self );
}

deleteonflag( var_0, var_1 )
{
    common_scripts\utility::_id_384A( var_0 );
    wait(var_1);
    self delete();
}

printslowmo( var_0 )
{
    if ( isdefined( level.debug_slowmo ) && level.debug_slowmo )
        return;
}

printspeech( var_0 )
{
    if ( isdefined( level.debug_speech ) && level.debug_speech )
        return;
}

playspeech( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printspeech( var_1 );

    level._id_0318 thread _id_A5A4::_id_69C4( var_0 );
}

playspeechcarradio( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printspeech( var_1 );

    var_2 = var_0 + "_r";
    level.car thread _id_A5A4::_id_69C4( var_2 );
}

playalasadspeech( var_0, var_1 )
{
    if ( isdefined( var_1 ) )
        printspeech( var_1 );

    level.alasad thread _id_A5A4::_id_69C4( var_0 );
}

randomizeguardcharacter()
{
    var_0 = self _meth_802C();
    var_1 = [];
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_1[var_3] = self _meth_802D( var_3 );
        var_2[var_3] = self _meth_802E( var_3 );
    }

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        if ( var_2[var_3] != "tag_weapon_right" )
            self _meth_802A( var_1[var_3], var_2[var_3] );
    }

    self._id_475D = undefined;
    self._id_477D = undefined;

    switch ( _func_0B2( 6 ) )
    {
        case 0:
            character\character_sp_arab_regular_asad::main();
            break;
        case 1:
            character\character_sp_arab_regular_sadiq::main();
            break;
        case 2:
            character\character_sp_arab_regular_ski_mask::main();
            break;
        case 3:
            character\character_sp_arab_regular_ski_mask2::main();
            break;
        case 4:
            character\character_sp_arab_regular_suren::main();
            break;
        case 5:
            character\character_sp_arab_regular_yasir::main();
            break;
    }
}

setcurbstompcharacter()
{
    var_0 = self _meth_802C();
    var_1 = [];
    var_2 = [];

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        var_1[var_3] = self _meth_802D( var_3 );
        var_2[var_3] = self _meth_802E( var_3 );
    }

    for ( var_3 = 0; var_3 < var_0; var_3++ )
    {
        if ( var_2[var_3] != "tag_weapon_right" )
            self _meth_802A( var_1[var_3], var_2[var_3] );
    }

    character\character_sp_arab_regular_yasir::main();
}

lerpshadowdetail( var_0, var_1 )
{
    var_2 = getdvarint( "sm_sunSampleSizeNear" );
    var_1 *= 20;
    var_3 = [];

    for ( var_4 = 0; var_4 < var_1; var_4++ )
    {
        var_5 = var_4 / var_1;
        var_6 = var_0 * var_5 + var_2 * ( 1 - var_5 );
        _func_0D6( "sm_sunSampleSizeNear", var_6 );
        wait 0.05;
    }

    _func_0D6( "sm_sunSampleSizeNear", var_0 );
}

playlinkedsound( var_0 )
{
    var_1 = spawn( "script_origin", ( 0, 0, 0 ) );
    var_1._id_02E2 = self._id_02E2;
    var_1.angles = self.angles;
    var_1 _meth_804F( self );
    var_1 thread _id_A5A4::_id_69C5( var_0, undefined, 1 );
    return var_1;
}

fake_tag( var_0, var_1, var_2 )
{
    if ( !isdefined( var_1 ) )
        var_1 = ( 0, 0, 0 );

    if ( !isdefined( var_2 ) )
        var_2 = ( 0, 0, 0 );

    var_3 = spawn( "script_model", self._id_02E2 );
    var_3 _meth_80B3( "tag_origin" );
    var_3 _meth_8056();
    var_3 _meth_804F( self, var_0, var_1, var_2 );
    thread fake_tag_destroy( var_3 );
    return var_3;
}

fake_tag_destroy( var_0 )
{
    self waittill( "death" );
    var_0 delete();
}

opfor_swaphead_for_facialanim()
{
    if ( isdefined( self._id_477D ) )
    {
        if ( self._id_477D == "head_sp_arab_regular_ski_mask" || self._id_477D == "head_sp_arab_regular_mowrap" )
        {
            var_0 = [];
            var_0[0] = "head_sp_arab_regular_asad";
            var_0[1] = "head_sp_arab_regular_sadiq";
            var_0[2] = "head_sp_arab_regular_suren";
            var_1 = [];
            var_1[0] = "helmet_sp_arab_regular_asad";
            var_1[1] = "helmet_sp_arab_regular_sadiq";
            var_1[2] = "helmet_sp_arab_regular_suren";
            var_2 = _func_0B2( 3 );
            self _meth_802A( self._id_477D );
            self _meth_801D( var_0[var_2], "", 1 );
            self._id_477D = var_0[var_2];
            self _meth_801D( var_1[var_2] );
            self._id_475D = var_1[var_2];
        }
    }
}

play_anim_on_ropehands( var_0, var_1 )
{
    var_2 = var_0 + "_ropehands";
    level.handsrope _meth_8055();

    if ( var_1 )
        level.handsrope _meth_804F( level.playerview );

    _id_A510::_id_0C24( level.handsrope, var_2 );

    if ( var_1 )
        level.handsrope _meth_8051();
}

update_handsrope_lighting_origin()
{
    level endon( "handsrope_deleted" );

    for (;;)
    {
        var_0 = level.car._id_02E2 + ( 0, 0, 36 );
        level.handsrope _meth_8477( var_0 );
        wait 0.05;
    }
}

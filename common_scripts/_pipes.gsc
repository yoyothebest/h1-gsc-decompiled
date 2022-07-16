// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    waitframe;
    var_0 = getentarray( "pipe_shootable", "targetname" );

    if ( !var_0.size )
        return;

    level._id_6289 = 0;
    level.limit_pipe_fx = 32;
    var_0 thread _id_6EDB();
    var_0 thread _id_5BBE();
    common_scripts\utility::_id_0D13( var_0, ::_id_682F );
    var_1 = var_0;
    var_2 = getentarray( "pipe_break", "targetname" );

    if ( var_2.size )
    {
        var_2 pipebreakinit( var_1 );
        pipemasterinit( var_2 );
        common_scripts\utility::_id_0D13( var_2, ::pipebreakthink );
    }

    level.overlaymaskfxwastriggered = 0;
}

_id_5BBE()
{
    level._id_060F = [];
    level._id_060F["MOD_UNKNOWN"] = ::_id_6827;
    level._id_060F["MOD_PISTOL_BULLET"] = ::_id_6825;
    level._id_060F["MOD_RIFLE_BULLET"] = ::_id_6825;
    level._id_060F["MOD_GRENADE"] = ::_id_6827;
    level._id_060F["MOD_GRENADE_SPLASH"] = ::_id_6827;
    level._id_060F["MOD_PROJECTILE"] = ::_id_6827;
    level._id_060F["MOD_PROJECTILE_SPLASH"] = ::_id_6827;
    level._id_060F["MOD_MELEE"] = ::_id_6826;
    level._id_060F["MOD_HEAD_SHOT"] = ::_id_6826;
    level._id_060F["MOD_CRUSH"] = ::_id_6826;
    level._id_060F["MOD_TELEFRAG"] = ::_id_6826;
    level._id_060F["MOD_FALLING"] = ::_id_6826;
    level._id_060F["MOD_SUICIDE"] = ::_id_6826;
    level._id_060F["MOD_TRIGGER_HURT"] = ::_id_6827;
    level._id_060F["MOD_EXPLOSIVE"] = ::_id_6827;
    level._id_060F["MOD_IMPACT"] = ::_id_6826;
}

_id_6825( var_0, var_1 )
{
    return var_0;
}

_id_6827( var_0, var_1 )
{
    if ( self.use_bullet_hitnormal )
        return undefined;

    var_2 = _func_114( _func_0EC( self.a, self.b, var_0 ) );
    var_0 = _func_0ED( self.a, self.b, var_0 );
    return var_0 + common_scripts\utility::vectorscale( var_2, 4 );
}

_id_6826( var_0, var_1 )
{
    return undefined;
}

pipe_calc_assert( var_0, var_1 )
{

}

pipemasterinit( var_0 )
{
    level.pipe_breaks = var_0;

    while ( level.pipe_breaks.size )
    {
        var_1 = level.pipe_breaks[level.pipe_breaks.size - 1];
        var_2 = spawnstruct();
        var_2._id_02A7 = "pipe master at (" + var_1._id_02E2 + ") position";
        var_1._id_59D8 = var_2;
        level.pipe_breaks = common_scripts\utility::_id_0CF6( level.pipe_breaks, var_1 );
        var_2 pipemasteriterate( var_1 );
    }
}

pipemasteriterate( var_0 )
{
    var_1 = get_pipes_in_range( var_0, level.pipe_breaks );

    if ( !isdefined( var_1 ) || var_1.size == 0 )
        return;

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
    {
        var_1[var_2]._id_59D8 = self;
        level.pipe_breaks = common_scripts\utility::_id_0CF6( level.pipe_breaks, var_1[var_2] );
    }

    for ( var_2 = 0; var_2 < var_1.size; var_2++ )
        pipemasteriterate( var_1[var_2] );
}

get_pipes_in_range( var_0, var_1 )
{
    var_2 = 34;

    if ( var_1.size < 1 )
        return;

    var_3 = [];
    var_4 = 0;

    for ( var_5 = 0; var_5 < var_1.size; var_5++ )
    {
        var_4 = 0;

        for ( var_6 = 0; var_6 < var_1[var_5].ends.size; var_6++ )
        {
            for ( var_7 = 0; var_7 < var_0.ends.size; var_7++ )
            {
                var_8 = _func_0EE( var_1[var_5].ends[var_6], var_0.ends[var_7] );

                if ( var_8 > var_2 )
                    continue;

                var_4 = 1;
                var_3[var_3.size] = var_1[var_5];
                break;
            }

            if ( var_4 )
                break;
        }
    }

    return var_3;
}

pipebreakinit( var_0 )
{
    for ( var_1 = 0; var_1 < self.size; var_1++ )
    {
        self[var_1].whole = common_scripts\utility::_id_3F33( self[var_1] _meth_8097(), var_0 );
        var_0 = common_scripts\utility::_id_0CF6( var_0, self[var_1].whole );
        self[var_1].fxnode = spawnstruct();
        self[var_1].fxnode._id_02E2 = self[var_1]._id_02E2;
        self[var_1].fxnode._id_0199 = common_scripts\utility::vectorscale( anglestoright( self[var_1].angles ), -1 );
        self[var_1].fxnode._id_04E0 = anglestoforward( self[var_1].angles );

        if ( self[var_1]._id_0398 == "fueltanker" )
        {
            var_2 = common_scripts\utility::_id_40FB( self[var_1].whole._id_04A4, "targetname" );
            self[var_1].fxnode._id_02E2 = var_2._id_02E2;
            self[var_1].fxnode._id_0199 = anglestoup( var_2.angles );
            self[var_1].fxnode._id_04E0 = anglestoforward( var_2.angles );
            self[var_1].fxnode._id_037B = anglestoright( var_2.angles );
        }

        self[var_1].hurtnode = [];

        switch ( self[var_1]._id_0398 )
        {
            case "fire64":
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2;
                break;
            case "fire96":
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, 16 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, -16 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                break;
            case "fire128":
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, 32 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, -32 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                break;
            case "fire256":
                self[var_1].fx_multinode = [];
                var_4 = spawnstruct();
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, 64 );
                var_4._id_02E2 = self[var_1].fxnode._id_02E2 + var_3;
                var_4._id_0199 = self[var_1].fxnode._id_0199;
                var_4._id_04E0 = self[var_1].fxnode._id_04E0;
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_4;
                var_4 = spawnstruct();
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, -64 );
                var_4._id_02E2 = self[var_1].fxnode._id_02E2 + var_3;
                var_4._id_0199 = self[var_1].fxnode._id_0199;
                var_4._id_04E0 = self[var_1].fxnode._id_04E0;
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_4;
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, 64 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, -64 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                break;
            case "fueltanker":
                self[var_1].fx_multinode = [];
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = self[var_1].fxnode;
                var_5 = spawnstruct();
                var_5._id_02E2 = self[var_1].fxnode._id_02E2;
                var_5._id_04E0 = self[var_1].fxnode._id_04E0;
                var_5._id_0199 = self[var_1].fxnode._id_0199 + common_scripts\utility::vectorscale( self[var_1].fxnode._id_037B, 1 );
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_5;
                var_5 = spawnstruct();
                var_5._id_02E2 = self[var_1].fxnode._id_02E2;
                var_5._id_04E0 = self[var_1].fxnode._id_04E0;
                var_5._id_0199 = self[var_1].fxnode._id_0199 + common_scripts\utility::vectorscale( self[var_1].fxnode._id_037B, -1 );
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_5;
                var_4 = spawnstruct();
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, 112 );
                var_4._id_02E2 = self[var_1].fxnode._id_02E2 + var_3;
                var_4._id_0199 = self[var_1].fxnode._id_0199;
                var_4._id_04E0 = self[var_1].fxnode._id_04E0;
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_4;
                var_5 = spawnstruct();
                var_5._id_02E2 = var_4._id_02E2;
                var_5._id_04E0 = var_4._id_04E0;
                var_5._id_0199 = var_4._id_0199 + common_scripts\utility::vectorscale( self[var_1].fxnode._id_037B, 1 );
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_5;
                var_5 = spawnstruct();
                var_5._id_02E2 = var_4._id_02E2;
                var_5._id_04E0 = var_4._id_04E0;
                var_5._id_0199 = var_4._id_0199 + common_scripts\utility::vectorscale( self[var_1].fxnode._id_037B, -1 );
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_5;
                var_4 = spawnstruct();
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, -112 );
                var_4._id_02E2 = self[var_1].fxnode._id_02E2 + var_3;
                var_4._id_0199 = self[var_1].fxnode._id_0199;
                var_4._id_04E0 = self[var_1].fxnode._id_04E0;
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_4;
                var_5 = spawnstruct();
                var_5._id_02E2 = var_4._id_02E2;
                var_5._id_04E0 = var_4._id_04E0;
                var_5._id_0199 = var_4._id_0199 + common_scripts\utility::vectorscale( self[var_1].fxnode._id_037B, 1 );
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_5;
                var_5 = spawnstruct();
                var_5._id_02E2 = var_4._id_02E2;
                var_5._id_04E0 = var_4._id_04E0;
                var_5._id_0199 = var_4._id_0199 + common_scripts\utility::vectorscale( self[var_1].fxnode._id_037B, -1 );
                self[var_1].fx_multinode[self[var_1].fx_multinode.size] = var_5;
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2;
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, 184 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, -184 );
                self[var_1].hurtnode[self[var_1].hurtnode.size] = self[var_1].fxnode._id_02E2 + var_3;
                break;
        }

        self[var_1].ends = [];
        var_6 = 0;

        switch ( self[var_1]._id_0398 )
        {
            case "fire64":
                var_6 = 32;
                break;
            case "fire96":
                var_6 = 48;
                break;
            case "fire128":
                var_6 = 64;
                break;
            case "fire256":
                var_6 = 128;
                break;
            case "fueltanker":
                var_6 = 184;
                break;
        }

        self[var_1].ends[self[var_1].ends.size] = self[var_1].fxnode._id_02E2;
        var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, var_6 );
        self[var_1].ends[self[var_1].ends.size] = self[var_1].fxnode._id_02E2 + var_3;
        var_3 = common_scripts\utility::vectorscale( self[var_1].fxnode._id_04E0, var_6 * -1 );
        self[var_1].ends[self[var_1].ends.size] = self[var_1].fxnode._id_02E2 + var_3;
    }
}

pipebreak_damage()
{
    var_0 = 1;
    var_1 = 250;
    var_2 = 200;

    if ( self._id_0398 == "fueltanker" )
        var_2 = 350;

    for ( var_3 = 0; var_3 < self.hurtnode.size; var_3++ )
        _func_189( self.hurtnode[var_3], var_2, var_1, var_0 );
}

pipebreakthink()
{
    self.use_bullet_hitnormal = 0;
    self _meth_8056();
    self _meth_82BB();
    thread pipebreakthink2();
    thread pipebreakthink3();
    thread pipebreakthink4();
    self.whole endon( "pipe_breaking" );

    for (;;)
    {
        self.whole waittill( "pipe_ruptured" );
        badplace_cylinder( "", 2, self.whole._id_02E2, 250, 250 );
        self._id_59D8 notify( "pipe_ruptured" );
        thread pipebreakthink2();
    }
}

pipebreakthink2()
{
    self.whole endon( "pipe_ruptured" );
    self.whole endon( "deleting" );
    self._id_59D8 waittill( "pipe_ruptured" );
    self.whole.numfx++;
    thread pipebreakthink2();
}

pipebreakthink3()
{
    self.whole endon( "pipe_breaking" );
    self._id_59D8 waittill( "hurtme" );
    wait(_func_0B3( 0.2 ));
    self.whole notify( "pipe_breaking" );
}

pipebreakthink4()
{
    self.whole waittill( "pipe_breaking" );
    self._id_59D8 notify( "hurtme" );

    switch ( self._id_0398 )
    {
        case "fueltanker":
            thread common_scripts\utility::_id_69C2( "explo_rock", self.fxnode._id_02E2 );
            break;
        default:
            if ( isdefined( self._id_59D8.firstsnd ) )
                thread common_scripts\utility::_id_69C2( "expl_gas_pipe_burst", self.fxnode._id_02E2 );
            else
            {
                self._id_59D8.firstsnd = 1;
                thread common_scripts\utility::_id_69C2( "expl_gas_pipe_burst_decay", self.fxnode._id_02E2 );
            }

            break;
    }

    thread pipebreak_damage();
    self.a = self.whole.a;
    self.b = self.whole.b;
    self _meth_82BC( 1 );
    self.whole notify( "deleting" );
    self.whole delete();
    self _meth_8055();
    self _meth_82BA();

    if ( isdefined( self.fx_multinode ) )
    {
        for ( var_0 = 0; var_0 < self.fx_multinode.size; var_0++ )
            playfx( level._id_058F["pipe_interactive"][self._id_0398], self.fx_multinode[var_0]._id_02E2, self.fx_multinode[var_0]._id_0199, self.fx_multinode[var_0]._id_04E0 );
    }
    else
        playfx( level._id_058F["pipe_interactive"][self._id_0398], self.fxnode._id_02E2, self.fxnode._id_0199, self.fxnode._id_04E0 );

    if ( self._id_0398 == "fueltanker" )
        _func_18C( 0.4, 1.5, self.fxnode._id_02E2, 600 );

    thread pipeimpact();
}

_id_682F()
{
    self _meth_82BC( 1 );
    var_0 = undefined;
    self.use_bullet_hitnormal = 0;

    if ( isdefined( self._id_7A99 ) && self._id_7A99 == "use_bullet_hitnormal" )
        self.use_bullet_hitnormal = 1;
    else if ( isdefined( self._id_04A4 ) )
    {
        var_0 = common_scripts\utility::_id_40FB( self._id_04A4, "targetname" );

        if ( isdefined( var_0 ) )
        {
            self.a = var_0._id_02E2;
            var_1 = anglestoforward( var_0.angles );
            var_1 = common_scripts\utility::vectorscale( var_1, 128 );
            self.b = self.a + var_1;
        }
    }
    else
    {
        var_1 = anglestoforward( self.angles );
        var_2 = common_scripts\utility::vectorscale( var_1, 64 );
        self.a = self._id_02E2 + var_2;
        var_2 = common_scripts\utility::vectorscale( var_1, -64 );
        self.b = self._id_02E2 + var_2;
    }

    if ( self._id_0398 == "fire" )
        self.limit = 4;

    thread pipethink();
}

pipethink()
{
    var_0 = ( 0, 0, 0 );
    self.numfx = 0;
    self endon( "deleting" );

    if ( isdefined( self.limit ) )
    {
        for (;;)
        {
            self waittill( "damage", var_1, var_2, var_3, var_0, var_4 );

            if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
                continue;

            pipethink_logic( self.numfx, self.limit, var_3, var_0, var_4 );
            self.numfx++;
        }
    }
    else
    {
        for (;;)
        {
            self waittill( "damage", var_1, var_2, var_3, var_0, var_4 );

            if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
                continue;

            pipethink_logic( level._id_6289, level.limit_pipe_fx, var_3, var_0, var_4 );
            level._id_6289++;
            thread pipethink2();
        }
    }
}

pipethink_logic( var_0, var_1, var_2, var_3, var_4 )
{
    if ( var_0 < var_1 )
    {
        var_3 = self [[ level._id_060F[var_4] ]]( var_3, var_4 );

        if ( !isdefined( var_3 ) )
            return;

        if ( self.use_bullet_hitnormal )
        {
            var_5 = var_3 - var_2;
            var_6 = var_3 + var_2;
            var_7 = _func_06B( var_5, var_6, 0 );
            var_8 = var_7["normal"];
        }
        else
            var_8 = _func_0EC( self.a, self.b, var_3 );

        if ( _func_0F3( var_8 ) == 0.0 )
            return;

        thread _id_682C( var_3, var_8 );
        var_9 = pipeoverlaymaskfxduration( level.pipe_fx_time[self._id_0398] );

        if ( var_9 )
            thread pipeoverlaymaskfx( var_9, var_3, var_8 );

        self notify( "pipe_ruptured" );
    }
    else
        self notify( "pipe_breaking" );
}

pipeoverlaymaskfxduration( var_0 )
{
    var_1 = 0;

    if ( getdvarint( "ui_multiplayer" ) )
        return var_1;

    if ( getomnvar( "ui_gasmask" ) != 0 && ( self._id_0398 == "steam" || self._id_0398 == "water" ) && isdefined( level._id_058F["screen_heavy_rain_cgoshp"] ) && isdefined( level.pipe_fx_time[self._id_0398] ) )
        return level.pipe_fx_time[self._id_0398];

    return var_1;
}

pipeoverlaymaskfx( var_0, var_1, var_2 )
{
    var_3 = gettime();
    var_4 = undefined;

    for (;;)
    {
        wait 0.1;
        var_5 = gettime();

        if ( var_5 - var_3 > var_0 * 1000 + 2000 )
        {
            if ( isdefined( var_4 ) )
            {
                var_4 delete();
                level.overlaymaskfxwastriggered = 0;
            }

            return;
        }

        var_6 = _func_0F0( var_1, level._id_0318 _meth_80AA() );
        var_7 = var_1 - level._id_0318._id_02E2;
        var_8 = _func_0F6( var_7, anglestoforward( level._id_0318.angles ) );

        if ( var_6 < 12000 && var_8 > 0 )
        {
            if ( !level.overlaymaskfxwastriggered )
            {
                level.overlaymaskfxwastriggered = 1;
                var_4 = spawnfx( level._id_058F["screen_heavy_rain_cgoshp"], level._id_0318._id_02E2 );
                triggerfx( var_4 );
            }

            continue;
        }

        if ( level.overlaymaskfxwastriggered && isdefined( var_4 ) )
        {
            var_4 delete();
            level.overlaymaskfxwastriggered = 0;
        }
    }
}

pipethink2()
{
    wait(level.pipe_fx_time[self._id_0398]);
    level._id_6289--;
}

_id_682C( var_0, var_1 )
{
    if ( self._id_0398 != "fire" )
    {
        playfx( level._id_058F["pipe_interactive"][self._id_0398], var_0, var_1 );
        thread common_scripts\utility::_id_69C2( level._id_0662["pipe_interactive"][self._id_0398], var_0 );
        return;
    }

    self endon( "pipe_breaking" );
    var_2 = 0.1;

    if ( !isdefined( self.burnsec ) )
    {
        self.burnsec = _func_0BC( 2 / var_2 );
        self.burninterval = _func_0BC( self.burnsec * 0.15 );
    }
    else
        self.burnsec -= self.burninterval;

    thread common_scripts\utility::_id_69C2( "mtl_gas_pipe_hit", var_0 );
    thread pipesndloopfx( "mtl_gas_pipe_flame_loop", var_0, "pipe_breaking" );
    thread pipe_snd_end( "mtl_gas_pipe_flame_end", var_0, "pipe_breaking" );

    if ( var_1 == ( 0, 0, 0 ) )
        var_1 = ( 0, 360, 0 );

    for ( var_3 = 0; var_3 < self.burnsec; var_3++ )
    {
        playfx( level._id_058F["pipe_interactive"][self._id_0398], var_0, var_1 );
        wait(var_2);
    }

    self notify( "pipe_breaking" );
}

pipeimpact()
{
    var_0 = ( 0, 0, 0 );
    self endon( "deleting" );

    for (;;)
    {
        self waittill( "damage", var_1, var_2, var_3, var_0, var_4 );

        if ( var_4 == "MOD_MELEE" || var_4 == "MOD_IMPACT" )
            continue;

        var_0 = self [[ level._id_060F[var_4] ]]( var_0, var_4 );
        var_3 = common_scripts\utility::vectorscale( var_3, -1 );
        playfx( level._id_058F["pipe_interactive"]["impact"], var_0, var_3 );
    }
}

pipesndloopfx( var_0, var_1, var_2, var_3 )
{
    self endon( var_2 );

    if ( !isdefined( var_0 ) )
        return;

    if ( isdefined( var_3 ) )
        wait(var_3);

    thread common_scripts\utility::play_loopsound_in_space_with_end( var_0, var_1, var_2 );
}

pipe_snd_end( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    self waittill( var_2 );
    thread common_scripts\utility::_id_69C2( var_0, var_1 );
}

_id_6EDB()
{
    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "steam" )
            continue;

        level._id_058F["pipe_interactive"][self[var_0]._id_0398] = loadfx( "fx/impacts/pipe_steam" );
        level._id_0662["pipe_interactive"][self[var_0]._id_0398] = "mtl_steam_pipe_hit";
        level.pipe_fx_time[self[var_0]._id_0398] = 5;
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "steam_canister" )
            continue;

        level._id_058F["pipe_interactive"][self[var_0]._id_0398] = loadfx( "vfx/props/canister_steam" );
        level._id_0662["pipe_interactive"][self[var_0]._id_0398] = "mtl_steam_pipe_hit";
        level.pipe_fx_time[self[var_0]._id_0398] = 5;
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "water" )
            continue;

        level._id_058F["pipe_interactive"][self[var_0]._id_0398] = loadfx( "fx/impacts/pipe_water" );
        level._id_0662["pipe_interactive"][self[var_0]._id_0398] = "mtl_water_pipe_hit";
        level.pipe_fx_time[self[var_0]._id_0398] = 2.6;
        break;
    }

    for ( var_0 = 0; var_0 < self.size; var_0++ )
    {
        if ( self[var_0]._id_0398 != "fire" )
            continue;

        level._id_058F["pipe_interactive"][self[var_0]._id_0398] = loadfx( "fx/impacts/pipe_fire" );
        level._id_058F["pipe_interactive"]["fire64"] = loadfx( "fx/explosions/pipe_explosion64" );
        level._id_058F["pipe_interactive"]["fire96"] = loadfx( "fx/explosions/pipe_explosion64" );
        level._id_058F["pipe_interactive"]["fire128"] = loadfx( "fx/explosions/pipe_explosion128" );
        level._id_058F["pipe_interactive"]["fire256"] = loadfx( "fx/explosions/pipe_explosion128" );
        level._id_058F["pipe_interactive"]["fueltanker"] = loadfx( "fx/explosions/pipe_explosion128" );
        break;
    }

    level._id_058F["pipe_interactive"]["impact"] = loadfx( "fx/impacts/small_metalhit_1" );
    update_pipe_fx_with_overrides();
}

override_pipe_fx( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level.pipe_fx_override ) )
        level.pipe_fx_override = [];

    if ( !isdefined( level.pipe_fx_override[var_0] ) )
        level.pipe_fx_override[var_0] = [];

    if ( isdefined( var_1 ) )
        level.pipe_fx_override[var_0]["fx"] = var_1;

    if ( isdefined( var_2 ) )
        level.pipe_fx_override[var_0]["sound"] = var_2;

    if ( isdefined( var_3 ) )
        level.pipe_fx_override[var_0]["time"] = var_3;
}

update_pipe_fx_with_overrides()
{
    if ( !isdefined( level.pipe_fx_override ) )
        return;

    if ( level.pipe_fx_override.size == 0 )
        return;

    var_0 = _func_1D3( level.pipe_fx_override );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( level.pipe_fx_override[var_2]["fx"] ) )
            level._id_058F["pipe_interactive"][var_2] = loadfx( level.pipe_fx_override[var_2]["fx"] );

        if ( isdefined( level.pipe_fx_override[var_2]["sound"] ) )
            level._id_0662["pipe_interactive"][var_2] = level.pipe_fx_override[var_2]["sound"];

        if ( isdefined( level.pipe_fx_override[var_2]["time"] ) )
            level.pipe_fx_time[var_2] = level.pipe_fx_override[var_2]["time"];
    }
}

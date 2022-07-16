// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    if ( getdvar( "r_reflectionProbeGenerate" ) == "1" )
        return;

    level._id_7A4E = [];
    level._id_7A4E["move_time"] = 5;
    level._id_7A4E["accel_time"] = 0;
    level._id_7A4E["decel_time"] = 0;
    level._id_7A4E["wait_time"] = 0;
    level._id_7A4E["delay_time"] = 0;
    level._id_7A4E["usable"] = 0;
    level._id_7A4E["hintstring"] = "activate";
    _id_7A44( "activate", &"MP_ACTIVATE_MOVER" );
    _id_7A45( "none", "" );
    level._id_7A5E = [];
    level._id_7A49 = [];
    waittillframeend;
    var_0 = [];
    var_1 = _id_7A4B();

    foreach ( var_3 in var_1 )
        var_0 = common_scripts\utility::_id_0CDD( var_0, getentarray( var_3, "classname" ) );

    common_scripts\utility::_id_0D13( var_0, ::_id_7A56 );
}

_id_7A4B()
{
    return [ "script_model_mover", "script_brushmodel_mover" ];
}

_id_7A5A()
{
    if ( isdefined( self._id_7A42 ) )
        return self._id_7A42;

    var_0 = _id_7A4B();

    foreach ( var_2 in var_0 )
    {
        if ( self.classname == var_2 )
        {
            self._id_7A42 = 1;
            return 1;
        }
    }

    return 0;
}

_id_7A44( var_0, var_1 )
{
    if ( !isdefined( level._id_7A55 ) )
        level._id_7A55 = [];

    level._id_7A55[var_0] = var_1;
}

_id_7A45( var_0, var_1 )
{
    if ( !isdefined( level._id_7A61 ) )
        level._id_7A61 = [];

    level._id_7A61[var_0] = var_1;
}

_id_7A43( var_0, var_1, var_2, var_3 )
{
    if ( !isdefined( level._id_7A49 ) )
        level._id_7A49 = [];

    if ( !isdefined( var_3 ) )
        var_3 = "default";

    if ( !isdefined( level._id_7A49[var_0] ) )
        level._id_7A49[var_0] = [];

    var_4 = spawnstruct();
    var_4._id_0C72 = var_1;
    var_4._id_0C79 = var_2;
    level._id_7A49[var_0][var_3] = var_4;
}

_id_7A56()
{
    self._id_7A42 = 1;
    self._id_5F9E = 0;
    self._id_6593 = self;
    self._id_9BEC = [];
    self._id_5788 = [];
    var_0 = [];

    if ( isdefined( self._id_04A4 ) )
        var_0 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );

    foreach ( var_2 in var_0 )
    {
        if ( !isdefined( var_2._id_0398 ) )
            continue;

        switch ( var_2._id_0398 )
        {
            case "origin":
                if ( !isdefined( var_2.angles ) )
                    var_2.angles = ( 0, 0, 0 );

                self._id_6593 = spawn( "script_model", var_2._id_02E2 );
                self._id_6593.angles = var_2.angles;
                self._id_6593 _meth_80B3( "tag_origin" );
                self._id_6593 _meth_804F( self );
                continue;
            case "scripted_node":
            case "scene_node":
                if ( !isdefined( var_2.angles ) )
                    var_2.angles = ( 0, 0, 0 );

                self._id_7B39 = var_2;
                continue;
            default:
                continue;
        }
    }

    var_4 = [];

    if ( isdefined( self._id_04A4 ) )
        var_4 = getentarray( self._id_04A4, "targetname" );

    foreach ( var_2 in var_4 )
    {
        if ( !isdefined( var_2._id_0398 ) )
            continue;

        var_6 = _func_124( var_2._id_0398, ";" );

        foreach ( var_8 in var_6 )
        {
            switch ( var_8 )
            {
                case "use_trigger_link":
                    var_2 _meth_806B();
                    var_2 _meth_804F( self );
                case "use_trigger":
                    var_2 _id_7A65();
                    thread _id_7A74( var_2 );
                    self._id_9BEC[self._id_9BEC.size] = var_2;
                    continue;
                case "link":
                    var_2 _meth_804F( self );
                    self._id_5788[self._id_5788.size] = var_2;
                    continue;
                default:
                    continue;
            }
        }
    }

    thread _id_7A65();
    thread _id_7A57();
    thread _id_7A69();
    thread _id_7A6A();
    thread _id_7A4A( self );
    thread _id_7A68();
    _id_7A6F();

    foreach ( var_12 in self._id_9BEC )
        _id_7A6C( var_12, 1 );

    self._id_7A56 = 1;
    self notify( "script_mover_init" );
}

_id_7A6F()
{
    if ( _id_7A58() )
        thread _id_7A48();
    else
        thread _id_7A5D();
}

_id_7A68()
{
    self._id_5F6C = self._id_02E2;
    self._id_5F6B = self.angles;
}

_id_7A67( var_0 )
{
    self notify( "mover_reset" );

    if ( _id_7A58() )
        self _meth_8276();

    self._id_02E2 = self._id_5F6C;
    self.angles = self._id_5F6B;
    self notify( "new_path" );
    waittillframeend;
    _id_7A6F();
}

_id_7A74( var_0 )
{
    self endon( "death" );

    for (;;)
    {
        var_0 waittill( "trigger" );

        if ( var_0._id_4253.size > 0 )
        {
            self notify( "new_path" );
            thread _id_7A5D( var_0 );
            continue;
        }

        self notify( "trigger" );
    }
}

_id_7A5C( var_0 )
{
    if ( isdefined( level._id_7A5E[var_0] ) )
    {
        self notify( "new_path" );
        self._id_4253 = level._id_7A5E[var_0];
        thread _id_7A5D();
    }
}

_id_0B9F( var_0 )
{
    return ( _func_0EB( var_0[0] ), _func_0EB( var_0[1] ), _func_0EB( var_0[2] ) );
}

_id_7A65()
{
    if ( isdefined( self._id_6697 ) && self._id_6697 )
        return;

    self._id_6697 = 1;
    self._id_4253 = [];
    self._id_5F6F = [];
    var_0 = [];
    var_1 = [];

    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = common_scripts\utility::_id_40FD( self._id_04A4, "targetname" );
        var_1 = getentarray( self._id_04A4, "targetname" );
    }

    for ( var_2 = 0; var_2 < var_0.size; var_2++ )
    {
        var_3 = var_0[var_2];

        if ( !isdefined( var_3._id_0398 ) )
            var_3._id_0398 = "goal";

        switch ( var_3._id_0398 )
        {
            case "ignore":
                if ( isdefined( var_3._id_04A4 ) )
                {
                    var_4 = common_scripts\utility::_id_40FD( var_3._id_04A4, "targetname" );

                    foreach ( var_6 in var_4 )
                        var_0[var_0.size] = var_6;
                }

                continue;
            case "goal":
                var_3 _id_7A57();
                var_3 _id_7A65();
                self._id_4253[self._id_4253.size] = var_3;

                if ( isdefined( var_3._id_6683["name"] ) )
                {
                    if ( !isdefined( level._id_7A5E[var_3._id_6683["name"]] ) )
                        level._id_7A5E[var_3._id_6683["name"]] = [];

                    var_8 = level._id_7A5E[var_3._id_6683["name"]].size;
                    level._id_7A5E[var_3._id_6683["name"]][var_8] = var_3;
                }

                continue;
            default:
                continue;
        }
    }

    foreach ( var_10 in var_1 )
    {
        if ( var_10 _id_7A5A() )
            self._id_5F6F[self._id_5F6F.size] = var_10;

        thread _id_7A62( var_10 );
    }
}

_id_7A62( var_0 )
{
    if ( !isdefined( var_0._id_0398 ) )
        return;

    if ( var_0 _id_7A5A() && !isdefined( var_0._id_7A56 ) )
        var_0 waittill( "script_mover_init" );

    var_1 = _func_124( var_0._id_0398, ";" );

    foreach ( var_3 in var_1 )
    {
        var_4 = _func_124( var_3, "_" );

        if ( var_4.size < 3 || var_4[1] != "on" )
            continue;

        var_5 = _func_123( var_4[0] );
        var_6 = var_4[2];

        for ( var_7 = 3; var_7 < var_4.size; var_7++ )
            var_6 = var_6 + "_" + var_4[var_7];

        switch ( var_5 )
        {
            case "connectpaths":
                thread _id_7A52( var_0, var_6, ::_id_7A4D, ::_id_7A51 );
                continue;
            case "disconnectpaths":
                thread _id_7A52( var_0, var_6, ::_id_7A51, ::_id_7A4D );
                continue;
            case "solid":
                var_0 _meth_82BB();
                thread _id_7A52( var_0, var_6, ::_id_7A6E, ::_id_7A60 );
                continue;
            case "notsolid":
                thread _id_7A52( var_0, var_6, ::_id_7A60, ::_id_7A6E );
                continue;
            case "delete":
                thread _id_7A52( var_0, var_6, ::_id_7A50 );
                continue;
            case "hide":
                thread _id_7A52( var_0, var_6, ::_id_7A54, ::_id_7A6D );
                continue;
            case "show":
                var_0 _meth_8056();
                thread _id_7A52( var_0, var_6, ::_id_7A6D, ::_id_7A54 );
                continue;
            case "triggerhide":
                thread _id_7A52( var_0, var_6, ::_id_7A71, ::_id_7A72 );
                continue;
            case "triggershow":
                var_0 common_scripts\utility::_id_97CC();
                thread _id_7A52( var_0, var_6, ::_id_7A72, ::_id_7A71 );
                continue;
            case "trigger":
                thread _id_7A52( var_0, var_6, ::_id_7A70, ::_id_7A67 );
                continue;
            default:
                continue;
        }
    }
}

_id_7A71( var_0 )
{
    self _meth_8094();
    common_scripts\utility::_id_97CC();
}

_id_7A72( var_0 )
{
    self _meth_8094();
    common_scripts\utility::_id_97CE();
}

_id_7A5F( var_0, var_1 )
{
    var_0 notify( var_1 );
}

_id_7A5B( var_0, var_1 )
{
    level notify( var_1 );
}

_id_7A4D( var_0 )
{
    self _meth_805A();
}

_id_7A51( var_0 )
{
    self _meth_8059( var_0 );
}

_id_7A6E( var_0 )
{
    self _meth_82BA();
}

_id_7A60( var_0 )
{
    self _meth_82BB();
}

_id_7A50( var_0 )
{
    self delete();
}

_id_7A54( var_0 )
{
    self _meth_8056();
}

_id_7A6D( var_0 )
{
    self _meth_8055();
}

_id_7A70( var_0 )
{
    self notify( "trigger" );
}

_id_7A52( var_0, var_1, var_2, var_3 )
{
    self endon( "death" );
    var_0 endon( "death" );

    for (;;)
    {
        self waittill( var_1, var_4 );
        var_0 [[ var_2 ]]( var_4 );

        if ( isdefined( var_3 ) && isdefined( var_4 ) )
        {
            var_4 _id_7A75( var_0, var_3 );
            continue;
        }

        break;
    }
}

_id_7A73()
{
    var_0 = [];

    if ( _id_7A59() )
        var_0[var_0.size] = self;

    foreach ( var_2 in self._id_5788 )
    {
        if ( var_2 _id_7A59() )
            var_0[var_0.size] = var_2;
    }

    if ( var_0.size == 0 )
        return;

    for (;;)
    {
        foreach ( var_5 in var_0 )
            var_5 _id_7A51();

        self waittill( "move_start" );

        foreach ( var_5 in var_0 )
            var_5 _id_7A4D();

        self waittill( "move_end" );
    }
}

_id_7A48()
{
    childthread _id_7A73();
    var_0 = self._id_6683["animation"];

    if ( isdefined( level._id_7A49[var_0]["idle"] ) )
        _id_7A66( level._id_7A49[var_0]["idle"], 0 );

    _id_7A4F();
    self notify( "move_start" );
    self notify( "start", self );
    var_1 = level._id_7A49[var_0]["default"];

    if ( isdefined( var_1 ) )
    {
        _id_7A66( var_1, 1 );
        self waittill( "end" );
    }

    self notify( "move_end" );
}

_id_7A66( var_0, var_1 )
{
    self notify( "play_animation" );

    if ( var_1 )
        thread _id_7A53();

    if ( isdefined( self._id_7B39 ) )
        self _meth_8487( var_0._id_0C72, self._id_7B39._id_02E2, self._id_7B39.angles, "script_mover_anim" );
    else
        self _meth_8277( var_0._id_0C72, "script_mover_anim" );
}

_id_7A53()
{
    self endon( "play_animation" );
    self endon( "mover_reset" );

    for (;;)
    {
        self waittill( "script_mover_anim", var_0 );
        self notify( var_0, self );
    }
}

_id_7A4F()
{
    if ( isdefined( self._id_6683["delay_till"] ) )
        level waittill( self._id_6683["delay_till"] );

    if ( isdefined( self._id_6683["delay_till_trigger"] ) && self._id_6683["delay_till_trigger"] )
        self waittill( "trigger" );

    if ( self._id_6683["delay_time"] > 0 )
        wait(self._id_6683["delay_time"]);
}

_id_7A5D( var_0 )
{
    self endon( "death" );
    self endon( "new_path" );
    childthread _id_7A73();

    if ( !isdefined( var_0 ) )
        var_0 = self;

    while ( var_0._id_4253.size != 0 )
    {
        var_1 = common_scripts\utility::_id_710E( var_0._id_4253 );
        var_2 = self;
        var_2 _id_7A4A( var_1 );
        var_2 _id_7A4F();
        var_3 = var_2._id_6683["move_time"];
        var_4 = var_2._id_6683["accel_time"];
        var_5 = var_2._id_6683["decel_time"];
        var_6 = 0;
        var_7 = 0;
        var_8 = _func_11D( var_1._id_02E2, var_1.angles, self._id_6593._id_02E2, self._id_6593.angles, self._id_02E2, self.angles );

        if ( var_2._id_02E2 != var_1._id_02E2 )
        {
            if ( isdefined( var_2._id_6683["move_speed"] ) )
            {
                var_9 = _func_0EE( var_2._id_02E2, var_1._id_02E2 );
                var_3 = var_9 / var_2._id_6683["move_speed"];
            }

            if ( isdefined( var_2._id_6683["accel_frac"] ) )
                var_4 = var_2._id_6683["accel_frac"] * var_3;

            if ( isdefined( var_2._id_6683["decel_frac"] ) )
                var_5 = var_2._id_6683["decel_frac"] * var_3;

            if ( var_3 <= 0 )
            {
                var_2 _meth_8094();
                var_2._id_02E2 = var_8["origin"];
            }
            else
                var_2 _meth_82AA( var_8["origin"], var_3, var_4, var_5 );

            var_6 = 1;
        }

        if ( _id_0B9F( var_8["angles"] ) != _id_0B9F( var_2.angles ) )
        {
            if ( var_3 <= 0 )
            {
                var_2 _meth_8094();
                var_2.angles = var_8["angles"];
            }
            else
                var_2 _meth_82B1( var_8["angles"], var_3, var_4, var_5 );

            var_7 = 1;
        }

        foreach ( var_11 in var_2._id_5F6F )
        {
            var_11 notify( "trigger" );
            _id_7A75( var_11, ::_id_7A67 );
        }

        var_2 notify( "move_start" );
        var_0 notify( "depart", var_2 );

        if ( isdefined( var_2._id_6683["name"] ) )
        {
            var_13 = "mover_depart_" + var_2._id_6683["name"];
            var_2 notify( var_13 );
            level notify( var_13, var_2 );
        }

        var_2 _id_7A47( 0 );

        if ( var_3 <= 0 )
        {

        }
        else if ( var_6 )
            var_2 waittill( "movedone" );
        else if ( var_7 )
            var_2 waittill( "rotatedone" );
        else
            wait(var_3);

        var_2 notify( "move_end" );
        var_1 notify( "arrive", var_2 );

        if ( isdefined( var_2._id_6683["name"] ) )
        {
            var_13 = "mover_arrive_" + var_2._id_6683["name"];
            var_2 notify( var_13 );
            level notify( var_13, var_2 );
        }

        if ( isdefined( var_2._id_6683["solid"] ) )
        {
            if ( var_2._id_6683["solid"] )
                var_2 _meth_82BA();
            else
                var_2 _meth_82BB();
        }

        foreach ( var_11 in var_1._id_5F6F )
        {
            var_11 notify( "trigger" );
            _id_7A75( var_11, ::_id_7A67 );
        }

        if ( isdefined( var_2._id_6683["wait_till"] ) )
            level waittill( var_2._id_6683["wait_till"] );

        if ( var_2._id_6683["wait_time"] > 0 )
            wait(var_2._id_6683["wait_time"]);

        var_2 _id_7A47( 1 );
        var_0 = var_1;
    }
}

_id_7A75( var_0, var_1 )
{
    thread _id_7A52( var_0, "mover_reset", var_1 );
}

_id_7A57()
{
    self._id_6683 = [];

    if ( !isdefined( self.angles ) )
        self.angles = ( 0, 0, 0 );

    self.angles = _id_0B9F( self.angles );
    _id_7A63( self._id_7A99 );
}

_id_7A63( var_0 )
{
    if ( !isdefined( var_0 ) )
        var_0 = "";

    var_1 = _func_124( var_0, ";" );

    foreach ( var_3 in var_1 )
    {
        var_4 = _func_124( var_3, "=" );

        if ( var_4.size != 2 )
            continue;

        if ( var_4[1] == "undefined" || var_4[1] == "default" )
        {
            self._id_6683[var_4[0]] = "<undefined>";
            continue;
        }

        switch ( var_4[0] )
        {
            case "move_time":
            case "accel_time":
            case "decel_time":
            case "wait_time":
            case "delay_time":
            case "move_speed":
            case "accel_frac":
            case "decel_frac":
                self._id_6683[var_4[0]] = _id_7A64( var_4[1] );
                continue;
            case "name":
            case "animation":
            case "hintstring":
            case "delay_till":
            case "wait_till":
                self._id_6683[var_4[0]] = var_4[1];
                continue;
            case "solid":
            case "usable":
            case "delay_till_trigger":
                self._id_6683[var_4[0]] = _func_0BC( var_4[1] );
                continue;
            case "script_params":
                var_5 = var_4[1];
                var_6 = level._id_7A61[var_5];

                if ( isdefined( var_6 ) )
                    _id_7A63( var_6 );

                continue;
            default:
                continue;
        }
    }
}

_id_7A64( var_0 )
{
    var_1 = 0;
    var_2 = _func_124( var_0, "," );

    if ( var_2.size == 1 )
        var_1 = _func_0BD( var_2[0] );
    else if ( var_2.size == 2 )
    {
        var_3 = _func_0BD( var_2[0] );
        var_4 = _func_0BD( var_2[1] );

        if ( var_3 >= var_4 )
            var_1 = var_3;
        else
            var_1 = _func_0B5( var_3, var_4 );
    }

    return var_1;
}

_id_7A4A( var_0 )
{
    foreach ( var_3, var_2 in var_0._id_6683 )
        _id_7A6B( var_3, var_2 );

    _id_7A6A();
}

_id_7A6B( var_0, var_1 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( var_0 == "usable" && isdefined( var_1 ) )
        _id_7A6C( self, var_1 );

    if ( isdefined( var_1 ) && isstring( var_1 ) && var_1 == "<undefined>" )
        var_1 = undefined;

    self._id_6683[var_0] = var_1;
}

_id_7A47( var_0 )
{
    if ( self._id_6683["usable"] )
        _id_7A6C( self, var_0 );

    foreach ( var_2 in self._id_9BEC )
        _id_7A6C( var_2, var_0 );
}

_id_7A6C( var_0, var_1 )
{
    if ( var_1 )
    {
        var_0 _meth_80C1();
        var_0 _meth_80DC( "HINT_ACTIVATE" );
        var_0 _meth_80DD( level._id_7A55[self._id_6683["hintstring"]] );
    }
    else
        var_0 _meth_80C2();
}

_id_7A69()
{
    self._id_6684 = [];

    foreach ( var_2, var_1 in self._id_6683 )
        self._id_6684[var_2] = var_1;
}

_id_7A6A()
{
    if ( isdefined( self._id_6684 ) )
    {
        foreach ( var_2, var_1 in self._id_6684 )
        {
            if ( !isdefined( self._id_6683[var_2] ) )
                _id_7A6B( var_2, var_1 );
        }
    }

    foreach ( var_2, var_1 in level._id_7A4E )
    {
        if ( !isdefined( self._id_6683[var_2] ) )
            _id_7A6B( var_2, var_1 );
    }
}

_id_7A59()
{
    return isdefined( self._id_03DA ) && self._id_03DA & 1;
}

_id_7A58()
{
    return isdefined( self._id_6683["animation"] );
}

init()
{
    level thread _id_7A4C();
    level thread _id_7A46();
}

_id_7A4C()
{
    for (;;)
    {
        level waittill( "connected", var_0 );
        var_0 thread _id_6C44();
    }
}

_id_7A46()
{
    for (;;)
    {
        level waittill( "spawned_agent", var_0 );
        var_0 thread _id_6C44();
    }
}

_id_6C44()
{
    self endon( "disconnect" );

    if ( _func_1FF( self ) )
        self endon( "death" );

    self._id_9A58 = 0;

    for (;;)
    {
        self waittill( "unresolved_collision", var_0 );

        if ( _func_1FF( self ) && isdefined( self.animclass ) )
        {
            if ( self _meth_854B() == "noclip" )
                continue;
        }

        self._id_9A58++;
        thread _id_1EDC();
        var_1 = 3;

        if ( isdefined( var_0 ) && isdefined( var_0._id_9A5E ) )
            var_1 = var_0._id_9A5E;

        if ( self._id_9A58 >= var_1 )
        {
            if ( isdefined( var_0 ) )
            {
                if ( isdefined( var_0._id_9A5A ) )
                    var_0 [[ var_0._id_9A5A ]]( self );
                else if ( isdefined( var_0._id_9A5B ) && var_0._id_9A5B )
                    var_0 _id_9A5F( self );
                else
                    var_0 _id_9A5C( self );
            }
            else
                _id_9A5C( self );

            self._id_9A58 = 0;
        }
    }
}

_id_1EDC()
{
    self endon( "unresolved_collision" );
    waittillframeend;

    if ( isdefined( self ) )
        self._id_9A58 = 0;
}

_id_9A5F( var_0 )
{
    var_1 = self;

    if ( !isdefined( var_1._id_02E5 ) )
    {
        var_0 _id_5F6D();
        return;
    }

    var_2 = 0;

    if ( level._id_91EB )
    {
        if ( isdefined( var_1._id_02E5._id_04A7 ) && var_1._id_02E5._id_04A7 != var_0._id_04A7 )
            var_2 = 1;
    }
    else if ( var_0 != var_1._id_02E5 )
        var_2 = 1;

    if ( !var_2 )
    {
        var_0 _id_5F6D();
        return;
    }

    var_3 = 1000;

    if ( isdefined( var_1._id_9A59 ) )
        var_3 = var_1._id_9A59;

    var_0 _meth_8053( var_3, var_1._id_02E2, var_1._id_02E5, var_1, "MOD_CRUSH" );
}

_id_9A5C( var_0, var_1 )
{
    var_2 = self._id_9A5D;

    if ( isdefined( var_2 ) )
        var_2 = _func_1BA( var_2, var_0._id_02E2 );
    else
    {
        var_2 = _func_0C6( var_0._id_02E2, 300, 0, 200 );
        var_2 = _func_1BA( var_2, var_0._id_02E2 );
    }

    var_3 = ( 0, 0, -100 );
    var_0 _meth_8434();
    var_0 _meth_8094();
    var_0 _meth_8335( var_0._id_02E2 + var_3 );

    for ( var_4 = 0; var_4 < var_2.size; var_4++ )
    {
        var_5 = var_2[var_4];
        var_6 = var_5._id_02E2;

        if ( !_func_168( var_6 ) )
            continue;

        if ( _func_167( var_6 ) )
            continue;

        if ( var_0 _meth_8180() == "prone" )
            var_0 _meth_8181( "crouch" );

        var_0 _meth_8335( var_6 );
        return;
    }

    var_0 _meth_8335( var_0._id_02E2 - var_3 );

    if ( !isdefined( var_1 ) )
        var_1 = 1;

    if ( var_1 )
        var_0 _id_5F6D();
}

_id_9A60( var_0 )
{

}

_id_5F6D()
{
    if ( isdefined( level._id_511D ) && !_func_1FF( self ) )
        return;

    maps\mp\_utility::_id_066F();
}

_id_6BCC( var_0 )
{
    self endon( "death" );
    self endon( "stop_player_pushed_kill" );

    for (;;)
    {
        self waittill( "player_pushed", var_1, var_2 );

        if ( _func_1AD( var_1 ) || _func_1FF( var_1 ) )
        {
            var_3 = _func_0F1( var_2 );

            if ( var_3 >= var_0 )
                _id_9A5F( var_1 );
        }
    }
}

_id_8EAC()
{
    self notify( "stop_player_pushed_kill" );
}

_id_6213()
{
    var_0 = self _meth_8431( 0 );

    if ( !isdefined( var_0 ) )
        return;

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_6106 ) && var_2._id_6106 )
            continue;

        var_2 _meth_8051();
        var_2 notify( "invalid_parent", self );
    }
}

_id_6FEE( var_0, var_1 )
{
    if ( isdefined( var_1 ) && isdefined( var_1._id_6105 ) && var_1._id_6105 )
        return;

    if ( isdefined( var_0._id_6A3E ) )
        playfx( common_scripts\utility::_id_3FA8( "airdrop_crate_destroy" ), self._id_02E2 );

    if ( isdefined( var_0._id_2663 ) )
        self thread [[ var_0._id_2663 ]]( var_0 );
    else
        self delete();
}

_id_45BE( var_0 )
{
    for (;;)
    {
        self waittill( "touching_platform", var_1 );

        if ( isdefined( var_0._id_940A ) && !self [[ var_0._id_940A ]]( var_1 ) )
            continue;

        if ( isdefined( var_0._id_9C4B ) && var_0._id_9C4B )
        {
            if ( !self _meth_80AB( var_1 ) )
            {
                wait 0.05;
                continue;
            }
        }

        thread _id_6FEE( var_0, var_1 );
        break;
    }
}

_id_45BD( var_0 )
{
    self waittill( "invalid_parent", var_1 );

    if ( isdefined( var_0._id_4F97 ) )
        self thread [[ var_0._id_4F97 ]]( var_0 );
    else
        thread _id_6FEE( var_0, var_1 );
}

_id_45BF( var_0 )
{
    self notify( "handle_moving_platforms" );
    self endon( "handle_moving_platforms" );
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "stop_handling_moving_platforms" );

    if ( !isdefined( var_0 ) )
        var_0 = spawnstruct();

    if ( isdefined( var_0._id_31BB ) )
        self endon( var_0._id_31BB );

    if ( isdefined( var_0._id_5794 ) )
        self _meth_804F( var_0._id_5794 );

    childthread _id_45BE( var_0 );
    childthread _id_45BD( var_0 );
}

_id_8E93()
{
    self notify( "stop_handling_moving_platforms" );
}

_id_5FA3( var_0 )
{

}

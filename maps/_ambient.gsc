// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level.ambient_zones = [];
    add_zone( "ac130" );
    add_zone( "alley" );
    add_zone( "bunker" );
    add_zone( "city" );
    add_zone( "container" );
    add_zone( "exterior" );
    add_zone( "exterior1" );
    add_zone( "exterior2" );
    add_zone( "exterior3" );
    add_zone( "exterior4" );
    add_zone( "exterior5" );
    add_zone( "forrest" );
    add_zone( "hangar" );
    add_zone( "interior" );
    add_zone( "interior_metal" );
    add_zone( "interior_stone" );
    add_zone( "interior_vehicle" );
    add_zone( "interior_wood" );
    add_zone( "mountains" );
    add_zone( "pipe" );
    add_zone( "shanty" );
    add_zone( "tunnel" );
    add_zone( "underpass" );

    if ( !isdefined( level._id_0B3D ) )
        level._id_0B3D = [];

    if ( !isdefined( level._id_0B23 ) )
        level._id_0B23 = [];

    if ( !isdefined( level._id_3BA6 ) )
        level._id_3BA6 = 1;

    level._id_3339 = 0;
    level._id_333A = 1;
    level._id_333D[level._id_3339] = "";
    level._id_333D[level._id_333A] = "";
    level._id_0B3A["interior"] = "";
    level._id_0B3A["exterior"] = "";
    level._id_0B3A["rain"] = "";
    maps\_equalizer::loadpresets();
}

activateambient( var_0 )
{
    level.ambient = var_0;

    if ( level.ambient == "exterior" )
        var_0 += level._id_0B3A["exterior"];

    if ( level.ambient == "interior" )
        var_0 += level._id_0B3A["interior"];

    _func_126( level._id_0B47[var_0 + level._id_0B3A["rain"]], 1 );
    thread _id_0B51( var_0 + level._id_0B3A["rain"] );
}

ambientvolume()
{
    for (;;)
    {
        self waittill( "trigger" );
        activateambient( "interior" );

        while ( level._id_0318 _meth_80AB( self ) )
            wait 0.1;

        activateambient( "exterior" );
    }
}

_id_0B4F( var_0, var_1, var_2 )
{
    if ( !isdefined( level.ambienteventent ) )
        level.ambienteventent[var_0] = spawnstruct();
    else if ( !isdefined( level.ambienteventent[var_0] ) )
        level.ambienteventent[var_0] = spawnstruct();

    level.ambienteventent[var_0]._id_5C1F = var_1;
    level.ambienteventent[var_0]._id_7131 = var_2 - var_1;
}

_id_0B50( var_0, var_1, var_2 )
{
    if ( !isdefined( level.ambienteventent[var_0].event_alias ) )
        var_3 = 0;
    else
        var_3 = level.ambienteventent[var_0].event_alias.size;

    level.ambienteventent[var_0].event_alias[var_3] = var_1;
    level.ambienteventent[var_0].event_weight[var_3] = var_2;
}

ambientreverb( var_0 )
{
    level._id_0318 _meth_832B( level._id_0B3D[var_0]["priority"], level._id_0B3D[var_0]["roomtype"], level._id_0B3D[var_0]["drylevel"], level._id_0B3D[var_0]["wetlevel"], level._id_0B3D[var_0]["fadetime"] );
    level waittill( "new ambient event track" );
    level._id_0318 _meth_832C( level._id_0B3D[var_0]["priority"], 2 );
}

setupeq( var_0, var_1, var_2 )
{
    if ( !isdefined( level._id_0B23[var_0] ) )
        level._id_0B23[var_0] = [];

    level._id_0B23[var_0][var_1] = var_2;
}

setup_eq_channels( var_0, var_1 )
{
    level._id_333D[var_1] = "exterior";

    if ( !isdefined( level._id_0B23 ) || !isdefined( level._id_0B23[var_0] ) )
    {
        _id_262E( var_1 );
        return;
    }

    level._id_333D[var_1] = var_0;
    var_2 = _func_1D3( level._id_0B23[var_0] );

    for ( var_3 = 0; var_3 < var_2.size; var_3++ )
    {
        var_4 = var_2[var_3];
        var_5 = maps\_equalizer::getfilter( level._id_0B23[var_0][var_4] );

        if ( !isdefined( var_5 ) )
            continue;

        for ( var_6 = 0; var_6 < 3; var_6++ )
        {
            if ( isdefined( var_5["type"][var_6] ) )
            {
                level._id_0318 _meth_8129( var_4, var_1, var_6, var_5["type"][var_6], var_5["gain"][var_6], var_5["freq"][var_6], var_5["q"][var_6] );
                continue;
            }

            level._id_0318 _meth_812B( var_1, var_4, var_6 );
        }
    }
}

_id_262E( var_0 )
{
    level._id_0318 _meth_812B( var_0 );
}

_id_0B51( var_0 )
{
    set_ambience_single( var_0 );
}

_id_8B2C( var_0 )
{
    level notify( "new ambient event track" );
    level endon( "new ambient event track" );

    if ( !isdefined( level._id_0318.soundent ) )
    {
        level._id_0318.soundent = spawn( "script_origin", ( 0, 0, 0 ) );
        level._id_0318.soundent.playingsound = 0;
    }
    else if ( level._id_0318.soundent.playingsound )
        level._id_0318.soundent waittill( "sounddone" );

    var_1 = level._id_0318.soundent;
    var_2 = level.ambienteventent[var_0]._id_5C1F;
    var_3 = level.ambienteventent[var_0]._id_7131;
    var_4 = 0;
    var_5 = 0;

    if ( isdefined( level._id_0B3D[var_0] ) )
        thread ambientreverb( var_0 );

    for (;;)
    {
        wait(var_2 + _func_0B3( var_3 ));

        while ( var_5 == var_4 )
            var_5 = ambientweight( var_0 );

        var_4 = var_5;
        var_1._id_02E2 = level._id_0318._id_02E2;
        var_1 _meth_804F( level._id_0318 );
        var_1 _meth_809C( level.ambienteventent[var_0].event_alias[var_5], "sounddone" );
        var_1.playingsound = 1;
        var_1 waittill( "sounddone" );
        var_1.playingsound = 0;
    }
}

ambientweight( var_0 )
{
    var_1 = level.ambienteventent[var_0].event_alias.size;
    var_2 = _func_0B2( var_1 );

    if ( var_1 > 1 )
    {
        var_3 = 0;
        var_4 = 0;

        for ( var_5 = 0; var_5 < var_1; var_5++ )
        {
            var_3++;
            var_4 += level.ambienteventent[var_0].event_weight[var_5];
        }

        if ( var_3 == var_1 )
        {
            var_6 = _func_0B3( var_4 );
            var_4 = 0;

            for ( var_5 = 0; var_5 < var_1; var_5++ )
            {
                var_4 += level.ambienteventent[var_0].event_weight[var_5];

                if ( var_6 < var_4 )
                {
                    var_2 = var_5;
                    break;
                }
            }
        }
    }

    return var_2;
}

add_zone( var_0 )
{
    level.ambient_zones[var_0] = 1;
}

check_ambience( var_0 )
{

}

ambient_trigger()
{
    var_0 = _func_124( self.ambient, " " );

    if ( var_0.size == 1 )
    {
        var_1 = var_0[0];

        for (;;)
        {
            self waittill( "trigger", var_2 );
            set_ambience_single( var_1 );
        }
    }

    var_3 = getent( self._id_04A4, "targetname" );
    var_4 = var_3._id_02E2;
    var_5 = undefined;

    if ( isdefined( var_3._id_04A4 ) )
    {
        var_6 = getent( var_3._id_04A4, "targetname" );
        var_5 = var_6._id_02E2;
    }
    else
        var_5 = var_4;

    var_7 = _func_0EE( var_4, var_5 );
    var_8 = var_0[0];
    var_9 = var_0[1];
    var_10 = 0.5;

    if ( isdefined( self._id_04A6 ) && self._id_04A6 == "ambient_exit" )
        var_10 = 0;

    for (;;)
    {
        self waittill( "trigger", var_2 );
        var_11 = undefined;

        while ( level._id_0318 _meth_80AB( self ) )
        {
            var_11 = _id_A5A4::_id_3E3D( var_4, var_5, level._id_0318._id_02E2, var_7 );

            if ( var_11 < 0 )
                var_11 = 0;

            if ( var_11 > 1 )
                var_11 = 1;

            set_ambience_blend( var_11, var_8, var_9 );
            wait 0.05;
        }

        if ( var_11 > var_10 )
            var_11 = 1;
        else
            var_11 = 0;

        set_ambience_blend( var_11, var_8, var_9 );
    }
}

ambient_end_trigger_think( var_0, var_1, var_2, var_3, var_4 )
{
    self endon( "death" );

    for (;;)
    {
        self waittill( "trigger", var_5 );
        ambient_trigger_sets_ambience_levels( var_0, var_1, var_2, var_3, var_4 );
    }
}

ambient_trigger_sets_ambience_levels( var_0, var_1, var_2, var_3, var_4 )
{
    level notify( "trigger_ambience_touched" );
    level endon( "trigger_ambience_touched" );

    for (;;)
    {
        var_5 = _id_A5A4::_id_3E3D( var_0, var_1, level._id_0318._id_02E2, var_2 );

        if ( var_5 < 0 )
        {
            var_5 = 0;
            set_ambience_single( var_3 );
            break;
        }

        if ( var_5 >= 1 )
        {
            set_ambience_single( var_4 );
            break;
        }

        set_ambience_blend( var_5, var_3, var_4 );
        wait 0.05;
    }
}

set_ambience_blend( var_0, var_1, var_2 )
{
    if ( level._id_333D[level._id_3339] != var_2 )
        setup_eq_channels( var_2, level._id_3339 );

    if ( level._id_333D[level._id_333A] != var_1 )
        setup_eq_channels( var_1, level._id_333A );

    level._id_0318 _meth_812C( var_0, level._id_3339 );

    if ( var_0 == 1 || var_0 == 0 )
        level.nextmsg = 0;

    if ( !isdefined( level.nextmsg ) )
        level.nextmsg = 0;

    if ( gettime() < level.nextmsg )
        return;

    level.nextmsg = gettime() + 200;
}

set_ambience_single( var_0 )
{
    if ( isdefined( level.ambienteventent[var_0] ) )
        thread _id_8B2C( var_0 );

    if ( level._id_333D[level._id_3339] != var_0 )
        setup_eq_channels( var_0, level._id_3339 );

    level._id_0318 _meth_812C( 1, level._id_3339 );
}

ambience_hud( var_0, var_1, var_2 )
{
    if ( getdvar( "loc_warnings" ) == "1" )
        return;

    if ( getdvar( "debug_hud" ) != "" )
        return;

    if ( !isdefined( level.amb_hud ) )
    {
        var_3 = -40;
        var_4 = 460;
        level.amb_hud = [];
        var_5 = _func_1A9();
        var_5.alignx = "left";
        var_5.aligny = "bottom";
        var_5._id_0530 = var_3 + 22;
        var_5._id_0538 = var_4 + 10;
        var_5.color = ( 0.4, 0.9, 0.6 );
        level.amb_hud["inner"] = var_5;
        var_5 = _func_1A9();
        var_5.alignx = "left";
        var_5.aligny = "bottom";
        var_5._id_0530 = var_3;
        var_5._id_0538 = var_4 + 10;
        var_5.color = ( 0.4, 0.9, 0.6 );
        level.amb_hud["frac_inner"] = var_5;
        var_5 = _func_1A9();
        var_5.alignx = "left";
        var_5.aligny = "bottom";
        var_5._id_0530 = var_3 + 22;
        var_5._id_0538 = var_4;
        var_5.color = ( 0.4, 0.9, 0.6 );
        level.amb_hud["outer"] = var_5;
        var_5 = _func_1A9();
        var_5.alignx = "left";
        var_5.aligny = "bottom";
        var_5._id_0530 = var_3;
        var_5._id_0538 = var_4;
        var_5.color = ( 0.4, 0.9, 0.6 );
        level.amb_hud["frac_outer"] = var_5;
    }

    if ( isdefined( var_2 ) )
    {
        level.amb_hud["frac_outer"]._id_0241 = _func_0BC( 100 * ( 1 - var_0 ) );
        level.amb_hud["frac_outer"].alpha = 1;
        level.amb_hud["outer"]._id_0241 = var_2;
        level.amb_hud["outer"].alpha = 1;
    }
    else
    {
        level.amb_hud["outer"].alpha = 0;
        level.amb_hud["frac_outer"].alpha = 0;
    }

    level.amb_hud["outer"] _meth_8086( 0.5 );
    level.amb_hud["frac_outer"] _meth_8086( 0.5 );
    level.amb_hud["frac_inner"]._id_0241 = _func_0BC( 100 * var_0 );
    level.amb_hud["frac_inner"].alpha = 1;
    level.amb_hud["frac_inner"] _meth_8086( 0.5 );
    level.amb_hud["inner"] _meth_80CC( var_1 );
    level.amb_hud["inner"].alpha = 1;
    level.amb_hud["inner"] _meth_8086( 0.5 );
}

set_ambience_blend_over_time( var_0, var_1, var_2 )
{
    if ( var_0 == 0 )
    {
        set_ambience_blend( 1, var_1, var_2 );
        return;
    }

    var_3 = 0;
    var_4 = 0.05;
    var_5 = 1 / ( var_0 / var_4 );

    for (;;)
    {
        var_3 += var_5;

        if ( var_3 >= 1 )
        {
            set_ambience_single( var_2 );
            break;
        }

        set_ambience_blend( var_3, var_1, var_2 );
        wait(var_4);
    }
}

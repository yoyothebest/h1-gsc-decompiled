// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_781E( var_0 )
{
    var_1 = level._id_0318 _meth_830E();

    if ( !isdefined( var_1 ) || var_1 == "none" )
    {

    }

    game["weaponstates"][var_0]["current"] = var_1;
    var_2 = level._id_0318 _meth_8310();
    game["weaponstates"][var_0]["offhand"] = var_2;
    game["weaponstates"][var_0]["list"] = [];
    var_3 = level._id_0318 _meth_8308();

    for ( var_4 = 0; var_4 < var_3.size; var_4++ )
        game["weaponstates"][var_0]["list"][var_4]["name"] = var_3[var_4];
}

_id_74B1( var_0 )
{
    if ( !isdefined( game["weaponstates"] ) )
        return 0;

    if ( !isdefined( game["weaponstates"][var_0] ) )
        return 0;

    level._id_0318 _meth_830D();

    for ( var_1 = 0; var_1 < game["weaponstates"][var_0]["list"].size; var_1++ )
    {
        var_2 = game["weaponstates"][var_0]["list"][var_1]["name"];

        if ( isdefined( level.legit_weapons ) )
        {
            if ( !isdefined( level.legit_weapons[var_2] ) )
                continue;
        }

        if ( var_2 == "c4" )
            continue;

        if ( var_2 == "claymore" )
            continue;

        level._id_0318 _meth_830B( var_2 );
        level._id_0318 _meth_832F( var_2 );
    }

    if ( isdefined( level.legit_weapons ) )
    {
        var_2 = game["weaponstates"][var_0]["offhand"];

        if ( isdefined( level.legit_weapons[var_2] ) )
            level._id_0318 _meth_8315( var_2 );

        var_2 = game["weaponstates"][var_0]["current"];

        if ( isdefined( level.legit_weapons[var_2] ) )
            level._id_0318 _meth_8312( var_2 );
    }
    else
    {
        level._id_0318 _meth_8315( game["weaponstates"][var_0]["offhand"] );
        level._id_0318 _meth_8312( game["weaponstates"][var_0]["current"] );
    }

    return 1;
}

_id_7F46()
{
    self _meth_8305( 1, "" );
    self _meth_8305( 2, "" );
    self _meth_8305( 3, "altMode" );
    self _meth_8305( 4, "" );
}

_id_4D31()
{
    _id_7F46();
    self _meth_830D();
}

_id_3DCC()
{
    if ( isdefined( level._id_57D6 ) )
        return level._id_57D6;

    return level._id_038E;
}

_id_67D9( var_0, var_1 )
{
    var_2 = _id_3DCC();

    if ( var_0 != var_2 )
        return;

    if ( !isdefined( game["previous_map"] ) )
        return;

    if ( game["previous_map"] != var_1 )
        return;

    level._id_05DE = 1;
    _id_74B1( var_1 );
    level._id_46F3 = 1;
}

_id_57D6( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    if ( isdefined( var_0 ) )
    {
        var_7 = _id_3DCC();

        if ( var_0 != var_7 )
            return;
    }

    if ( !isdefined( level._id_05DE ) )
    {
        if ( isdefined( var_1 ) )
        {
            level._id_2792 = var_1;
            level._id_0318 _meth_830B( var_1 );
        }

        if ( isdefined( var_2 ) )
            level._id_0318 _meth_830B( var_2 );

        if ( isdefined( var_1 ) )
            level._id_0318 _meth_8312( var_1 );
        else if ( isdefined( var_2 ) )
            level._id_0318 _meth_8312( var_2 );
    }

    if ( isdefined( var_3 ) )
    {
        level._id_0318 _meth_8341( var_3 );
        level._id_0318 _meth_830B( var_3 );
    }

    if ( isdefined( var_4 ) )
    {
        level._id_0318 _meth_8316( var_4 );
        level._id_0318 _meth_830B( var_4 );
    }

    if ( isdefined( var_5 ) )
        level._id_0318 _meth_8340( var_5 );

    if ( isdefined( var_6 ) )
        level._id_1A3D = var_6;

    level._id_46F3 = 1;
}

_id_57DB( var_0, var_1, var_2 )
{
    if ( !isdefined( var_0 ) )
        return;

    if ( level._id_038E != var_0 )
        return;

    if ( isdefined( var_1 ) )
    {
        level._id_0318 _meth_830B( var_1 );
        level._id_0318 _meth_8305( 2, "weapon", var_1 );
    }

    if ( isdefined( var_2 ) )
    {
        level._id_0318 _meth_830B( var_2 );
        level._id_0318 _meth_8305( 4, "weapon", var_2 );
    }
}

_id_57D8()
{
    level._id_57DA = 1;
    level notify( "loadout complete" );
}

_id_2783()
{
    if ( level._id_46F3 )
        return;

    _id_57D6( undefined, "mp5", undefined, "fraggrenade", "flash_grenade", "viewmodel_base_viewhands" );
    level._id_5985 = 1;
}

loadoutcustomization()
{
    switch ( level._id_038E )
    {
        case "killhouse":
            loadout_killhouse();
            break;
        case "cargoship":
            break;
        case "coup":
            break;
        case "blackout":
            loadout_blackout();
            break;
        case "armada":
            break;
        case "bog_a":
            break;
        case "hunted":
            break;
        case "ac130":
            break;
        case "bog_b":
            break;
        case "airlift":
            break;
        case "aftermath":
            break;
        case "village_assault":
            break;
        case "scoutsniper":
            loadout_scoutsniper();
            break;
        case "sniperescape":
            loadout_sniperescape();
            break;
        case "village_defend":
            loadout_village_defend();
            break;
        case "ambush":
            loadout_ambush();
            break;
        case "icbm":
            break;
        case "launchfacility_a":
            loadout_launchfacility_a();
            break;
        case "launchfacility_b":
            loadout_launchfacility_b();
            break;
        case "jeepride":
            break;
        case "airplane":
            break;
        case "simplecredits":
            break;
    }
}

loadout_killhouse()
{
    level._id_0318 _meth_82F3( "fraggrenade", 0 );
    level._id_0318 _meth_82F3( "flash_grenade", 0 );
}

loadout_blackout()
{
    level._id_0318 _meth_832F( "m4m203_silencer_reflex" );
    level._id_0318 _meth_832F( "m14_scoped_silencer_woodland" );
}

loadout_scoutsniper()
{
    level._id_0318 _meth_832F( "m14_scoped_silencer" );
    level._id_0318 _meth_832F( "usp_silencer" );
}

loadout_sniperescape()
{
    if ( level._id_3BFE >= 2 )
    {
        level._id_0318 _meth_82F3( "claymore", 10 );
        level._id_0318 _meth_82F3( "c4", 6 );
    }
    else
    {
        level._id_0318 _meth_82F3( "claymore", 8 );
        level._id_0318 _meth_82F3( "c4", 3 );
    }
}

loadout_village_defend()
{
    level._id_0318 _meth_832F( "claymore" );
}

loadout_ambush()
{
    level._id_0318 _meth_82F4( "remington700", 10 );
}

loadout_launchfacility_a()
{
    level._id_0318 _meth_832F( "claymore" );
}

loadout_launchfacility_b()
{
    var_0 = undefined;
    var_1 = 0;
    var_2 = level._id_0318 _meth_8309();

    foreach ( var_4 in var_2 )
    {
        if ( _func_120( var_4, "javelin" ) )
        {
            var_0 = var_4;
            continue;
        }

        if ( _func_120( var_4, "m4m203_silencer_reflex" ) )
            var_1 = 1;
    }

    if ( isdefined( var_0 ) )
    {
        level._id_0318 _meth_830C( var_0 );

        if ( var_1 )
            level._id_0318 _meth_830B( "usp_silencer" );
        else
            level._id_0318 _meth_830B( "m4m203_silencer_reflex" );

        level._id_0318 _meth_8313( "m4m203_silencer_reflex" );
    }
}

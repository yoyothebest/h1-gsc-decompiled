// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    var_0 = getentarray( "script_model", "classname" );

    foreach ( var_2 in var_0 )
    {
        if ( isdefined( var_2._id_79BF ) )
            var_2 thread exploderanim_think();
    }
}

exploderanim_think()
{
    for (;;)
    {
        self waittill( "play_exploder_anim" );
        thread anim_play();
    }
}

anim_play()
{
    var_0 = undefined;
    var_1 = _func_124( self._id_04A6, ":;, " );

    if ( var_1.size > 1 && isdefined( var_1[1] ) )
        var_0 = var_1[1];
    else
        var_0 = self._id_029C + "_anim";

    var_2 = get_animtree( var_0 );
    _id_A5A4::_id_0D61( var_2 );
    _id_A510::_id_0C24( self, var_0 );
}

get_animtree( var_0 )
{
    var_1 = undefined;

    for ( var_2 = 0; var_2 < level.exploder_animtrees.size; var_2++ )
    {
        var_3 = _func_1D3( level._id_78AC[level.exploder_animtrees[var_2]] );

        if ( common_scripts\utility::_id_0CE4( var_3, var_0 ) )
        {
            var_1 = level.exploder_animtrees[var_2];
            break;
        }
    }

    return var_1;
}

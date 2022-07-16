// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{

}

_id_9B0C( var_0, var_1 )
{
    if ( !_func_1AD( self ) || !isdefined( var_0 ) )
        return;

    switch ( var_0 )
    {
        case "scavenger":
            self _meth_82F1( "scavenger_pack_pickup" );

            if ( !level._id_46CA )
                self _meth_82F8( "damage_feedback", var_0 );

            break;
        case "hitblastshield":
        case "hitlightarmor":
        case "hitjuggernaut":
            self _meth_82F1( "mp_hit_armor" );
            self _meth_82F8( "damage_feedback", var_0 );
            break;
        case "mp_solar":
            if ( !isdefined( self._id_849F ) )
            {
                if ( isdefined( level._id_598B ) )
                    self thread [[ level._id_598B ]]();
            }
            else
                self._id_25A1 = 10;

            break;
        case "laser":
            if ( isdefined( level._id_7CC8 ) )
            {
                if ( !isdefined( self._id_849F ) )
                {
                    if ( isdefined( level._id_598B ) )
                        self thread [[ level._id_598B ]]( level._id_7CC8 );
                }
            }

            break;
        case "headshot":
            self _meth_82F1( "mp_hit_headshot" );
            self _meth_82F8( "damage_feedback", "headshot" );
            break;
        case "hitmorehealth":
            self _meth_82F1( "mp_hit_armor" );
            self _meth_82F8( "damage_feedback", "hitmorehealth" );
            break;
        case "killshot":
            self _meth_82F1( "mp_hit_kill" );
            self _meth_82F8( "damage_feedback", "killshot" );
            break;
        case "killshot_headshot":
            self _meth_82F1( "mp_hit_kill_headshot" );
            self _meth_82F8( "damage_feedback", "killshot_headshot" );
            break;
        case "none":
            break;
        default:
            self _meth_82F1( "mp_hit_default" );
            self _meth_82F8( "damage_feedback", "standard" );
            break;
    }
}

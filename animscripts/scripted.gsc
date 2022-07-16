// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self endon( "death" );
    self notify( "killanimscript" );
    self notify( "clearSuppressionAttack" );
    self.a._id_8FE8 = 0;
    self._id_2001["root"] = %body;
    self endon( "end_sequence" );
    self _meth_8241( self._id_2001["notifyName"], self._id_2001["origin"], self._id_2001["angles"], self._id_2001["anim"], self._id_2001["animMode"], self._id_2001["root"], self._id_2001["goalTime"] );
    self._id_2001 = undefined;

    if ( isdefined( self._id_7B35 ) || isdefined( self._id_35C2 ) )
    {
        animscripts\face::_id_7828( self._id_35C2, self._id_7B35, 0.9, "scripted_anim_facedone" );
        self._id_35C2 = undefined;
        self._id_7B35 = undefined;
    }

    if ( isdefined( self._id_2670 ) )
        self._id_266F = self._id_2670;

    self waittill( "killanimscript" );
}

init( var_0, var_1, var_2, var_3, var_4, var_5, var_6 )
{
    self._id_2001["notifyName"] = var_0;
    self._id_2001["origin"] = var_1;
    self._id_2001["angles"] = var_2;
    self._id_2001["anim"] = var_3;

    if ( isdefined( var_4 ) )
        self._id_2001["animMode"] = var_4;
    else
        self._id_2001["animMode"] = "normal";

    if ( isdefined( var_5 ) )
        self._id_2001["root"] = var_5;
    else
        self._id_2001["root"] = %body;

    self._id_2001["goalTime"] = var_6;
}

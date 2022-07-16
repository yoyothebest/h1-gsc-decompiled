// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );

    if ( isdefined( self._id_0142 ) && isdefined( self._id_0142._id_0426 ) && self._id_0142._id_0426 == self )
    {
        self _meth_8051();
        self._id_0142._id_0426 = undefined;
    }

    self _meth_8144( %root, 0.2 );
    self _meth_8115( "dog_pain_anim", %german_shepherd_run_pain, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "dog_pain_anim" );
}

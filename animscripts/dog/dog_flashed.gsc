// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );
    self endon( "stop_flashbang_effect" );
    wait(_func_0B5( 0, 0.4 ));
    self _meth_8144( %root, 0.1 );
    var_0 = _id_A5A4::_id_38A7();

    if ( var_0 > 2 && _func_0B2( 100 ) > 60 )
        self _meth_8115( "flashed_anim", %german_shepherd_run_pain, 1, 0.2, self._id_0C78 * 0.75 );
    else
        self _meth_8115( "flashed_anim", %german_shepherd_run_flashbang_b, 1, 0.2, self._id_0C78 );

    var_1 = getanimlength( %german_shepherd_run_flashbang_b ) * self._id_0C78;

    if ( var_0 < var_1 )
        animscripts\notetracks::_id_2D0B( var_0, "flashed_anim" );
    else
        animscripts\shared::_id_2D06( "flashed_anim" );

    self._id_38AF = 0;
    self notify( "stop_flashbang_effect" );
}

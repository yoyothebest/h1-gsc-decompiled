// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("dog");

main()
{
    self endon( "killanimscript" );

    if ( isdefined( self.a._id_612E ) )
    {
        wait 1.1;
        var_0 = self _meth_813E();

        if ( isdefined( var_0 ) )
        {
            var_1 = common_scripts\utility::_id_8959();
            var_1._id_02E2 = self._id_02E2;
            var_1.angles = self.angles;
            self _meth_804F( var_1 );
            var_1 _meth_82AA( var_0, 0.5 );
            wait 0.5;
            self _meth_8051();
            var_1 delete();
        }
        else
            wait 0.5;

        return;
    }

    self _meth_8051();

    if ( isdefined( self._id_0142 ) && isdefined( self._id_0142._id_0426 ) && self._id_0142._id_0426 == self )
        self._id_0142._id_0426 = undefined;

    self _meth_8144( %root, 0.2 );
    self _meth_8115( "dog_anim", %german_shepherd_death_front, 1, 0.2, 1 );
    animscripts\shared::_id_2D06( "dog_anim" );
}

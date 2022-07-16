// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self._id_28B4 = "crouch";
    animscripts\utility::_id_9AF5();
    self.a._id_5F5B = "stop";
    var_0 = self _meth_8198();
    var_0 thread _id_99B4( self );
    self._id_6F8E = %crouchsawgunner_aim;
    self._id_07F5 = %saw_gunner_lowwall_idle;
    self._id_07F4 = %saw_gunner_lowwall_firing;
    thread animscripts\saw\common::main( var_0 );
}
#using_animtree("mg42");

_id_99B4( var_0 )
{
    self _meth_8117( #animtree );
    self._id_07F5 = %saw_gunner_lowwall_idle_mg;
    self._id_07F4 = %saw_gunner_lowwall_firing_mg;
    self endon( "death" );
    var_0 waittill( "killanimscript" );
    self _meth_8118();
}

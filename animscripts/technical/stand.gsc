// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool
#using_animtree("generic_human");

main()
{
    self._id_28B4 = "stand";
    animscripts\utility::_id_9AF5();
    self.a._id_5F5B = "stop";
    var_0 = self _meth_8198();
    var_0 thread _id_99B4( self );
    self._id_6F8E = %technicalgunner_aim;
    self._id_07F5 = %technical_turret_driveidle;
    self._id_07F4 = %technical_turret_firing;
    self._id_6658 = ::_id_9208;
    self._id_2652 = %technical_turret_death;
    thread animscripts\saw\common::main( var_0 );
}

_id_9208()
{
    self _meth_8112( "painanim", %technical_turret_pain, %body, 1, 0.1, 1 );
    animscripts\shared::_id_2D06( "painanim" );
}
#using_animtree("mg42");

_id_99B4( var_0 )
{
    self._id_024E = 180;
    self._id_037D = 180;
    self _meth_8117( #animtree );
    self._id_07F5 = %saw_gunner_idle_mg;
    self._id_07F4 = %saw_gunner_firing_mg_add;
    self endon( "death" );
    var_0 waittill( "killanimscript" );
    self _meth_8118();
}

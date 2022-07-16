// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_0C50 = [];
    self._id_0C50["hiding"]["stand"] = ::_id_7F25;
    self._id_0C50["hiding"]["crouch"] = ::_id_7F25;
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_swim_right" );

    if ( !isdefined( self._id_0CBC ) || self._id_0CBC != "cover_corner_r" )
        self._id_0CBC = "cover_corner_r";

    var_0 = anim._id_0CCA["soldier"]["swim"]["arrival_cover_corner_r_angleDelta"][4][4];
    animscripts\corner::_id_2222( "right", var_0[1] );
}

_id_013F()
{
    animscripts\corner::_id_3143();
    animscripts\cover_behavior::_id_013F( "right" );
}

_id_7F25()
{
    self.a._id_0CD8 = animscripts\swim::_id_4100( "cover_corner_r" );
    var_0 = anim._id_0CCA["soldier"]["swim"]["arrival_cover_corner_r_angleDelta"][4][4];
    self._id_4884 = var_0[1];
}

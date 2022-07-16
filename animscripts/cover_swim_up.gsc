// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    self._id_0C50 = [];
    self._id_0C50["hiding"]["stand"] = ::_id_7F26;
    self._id_0C50["hiding"]["crouch"] = ::_id_7F26;
    self endon( "killanimscript" );
    animscripts\utility::_id_4DD7( "cover_swim_up" );

    if ( !isdefined( self._id_0CBC ) || self._id_0CBC != "cover_u" )
        self._id_0CBC = "cover_u";

    animscripts\corner::_id_2222( "up", 0 );
}

_id_013F()
{
    animscripts\corner::_id_3143();
    animscripts\cover_behavior::_id_013F( "up" );
}

_id_7F26()
{
    self.a._id_0CD8 = animscripts\swim::_id_4100( "cover_u" );
    self._id_4884 = 0;
}

// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

_id_54FF()
{
    self endon( "death" );
    self endon( "disconnect" );
    self endon( "faux_spawn" );
    self._id_54DA = undefined;
    self._id_A1C7 = 0;
    self.has_laser = 0;

    for (;;)
    {
        while ( maps\mp\_utility::_id_50F9() && self.has_laser )
        {
            wait 0.05;
            self _meth_80B5();
            self._id_A1C7 = 1;
            continue;
        }

        if ( self._id_A1C7 && self.has_laser )
        {
            self._id_A1C7 = 0;

            if ( maps\mp\gametypes\_class::_id_5101( self _meth_830E() ) || maps\mp\gametypes\_class::_id_5198( self _meth_830E() ) )
                self _meth_80B4( "mp_attachment_lasersight_short" );
            else
                self _meth_80B4( "mp_attachment_lasersight" );
        }

        if ( _func_120( self _meth_830E(), "maaws" ) )
            self.has_laser = 1;

        if ( self.has_laser && self _meth_812E() )
        {
            if ( isdefined( self._id_54DA ) && self._id_54DA )
            {
                self _meth_80B5();
                self._id_54DA = 0;

                while ( !self _meth_84D8() && self _meth_812E() )
                    wait 0.05;

                while ( self _meth_84D8() && self _meth_812E() )
                    wait 0.05;

                while ( self _meth_812E() )
                    wait 0.05;

                if ( maps\mp\gametypes\_class::_id_5101( self _meth_830E() ) || maps\mp\gametypes\_class::_id_5198( self _meth_830E() ) )
                    self _meth_80B4( "mp_attachment_lasersight_short" );
                else
                    self _meth_80B4( "mp_attachment_lasersight" );

                self._id_54DA = 1;
            }
        }

        if ( !self.has_laser )
        {
            if ( isdefined( self._id_54DA ) && self._id_54DA )
            {
                self _meth_80B5();
                self._id_54DA = 0;
            }
        }
        else if ( !isdefined( self._id_54DA ) || !self._id_54DA )
        {
            if ( maps\mp\gametypes\_class::_id_5101( self _meth_830E() ) || maps\mp\gametypes\_class::_id_5198( self _meth_830E() ) )
                self _meth_80B4( "mp_attachment_lasersight_short" );
            else
                self _meth_80B4( "mp_attachment_lasersight" );

            self._id_54DA = 1;
        }

        wait 0.05;
    }
}

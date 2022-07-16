// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

main()
{
    level._id_058F["ac130_pinetree_trunk"] = loadfx( "vfx/map/ac130/ac130_pinetree_trunk" );
    precachemodel( "ac130_pine01_stump" );
    var_0 = 500;
    var_1 = getentarray( "ac130_tree", "targetname" );
    common_scripts\utility::_id_76BB( "ac130_tree", ::ac130_tree_setup );
}
#using_animtree("script_model");

ac130_tree_setup()
{
    self _meth_8117( #animtree );
    self.ac130_tree_health = 900;
    self.ac130_tree_anims = [];
    self.ac130_tree_anims["still"] = %ac130_pine01_still;
    self.ac130_tree_anims["sway"][0] = %ac130_pine01_sway01;
    self.ac130_tree_anims["sway"][1] = %ac130_pine01_sway02;
    self.ac130_tree_anims["sway"][2] = %ac130_pine01_sway03;
    self.ac130_tree_anims["sway"][3] = %ac130_pine01_sway04;

    if ( isdefined( self._id_04A4 ) )
    {
        var_0 = getent( self._id_04A4, "targetname" );

        if ( isdefined( var_0 ) )
        {
            var_0 _meth_82BC( 1 );
            self.ac130_hitbox = var_0;
            thread ac130_tree_think();
        }
    }
}

ac130_tree_wobble( var_0 )
{
    if ( self.ac130_tree_health < 0 )
    {
        ac130_tree_death();
        return;
    }

    var_1 = 1000.0;
    var_2 = _func_0E9( var_0 / var_1, 0.5, 1.0 ) * _func_0B5( 0.95, 1.05 );
    var_3 = self.ac130_tree_anims["sway"][_func_0B2( self.ac130_tree_anims["sway"].size )];
    self _meth_814D( var_3, var_2, 0.0, _func_0B5( 0.75, 1.25 ) );
    wait(getanimlength( var_3 ));
    self _meth_8144( var_3, 0.0 );
}

ac130_tree_death()
{
    var_0 = spawn( "script_model", self _meth_8097() );
    var_0 _meth_80B3( "ac130_pine01_stump" );
    self _meth_8056();
    playfx( level._id_058F["ac130_pinetree_trunk"], self._id_02E2 );
    wait 1.0;
    self.ac130_hitbox delete();
    self notify( "death" );
    self delete();
}

ac130_tree_think()
{
    self endon( "death" );
    self _meth_814D( self.ac130_tree_anims["still"], 1.0, 0.0, 1.0 );

    for (;;)
    {
        self.ac130_hitbox waittill( "damage", var_0, var_1, var_2, var_3, var_4 );

        if ( isdefined( var_1 ) && _func_1AD( var_1 ) )
        {
            var_5 = var_1 _meth_830E();

            switch ( _func_123( var_5 ) )
            {
                case "ac130_25mm":
                    ac130_tree_wobble( var_0 );
                    continue;
                case "ac130_40mm":
                    self.ac130_tree_health -= var_0;
                    ac130_tree_wobble( var_0 );
                    continue;
                case "ac130_105mm":
                    ac130_tree_death();
                    continue;
                default:
                    continue;
            }
        }
    }
}

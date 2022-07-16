// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

dragunov_scope_init()
{
    var_0 = [];
    var_0["bog_b"] = "bog_b_dragunov";
    var_0["armada"] = "armada_dragunov";

    if ( isdefined( var_0[level._id_038E] ) )
        thread dragunov_scope_monitor( var_0[level._id_038E] );
}

dragunov_scope_monitor( var_0 )
{
    var_1 = 0;
    var_2 = 0;

    for (;;)
    {
        var_3 = level._id_0318 _meth_830E();
        var_4 = level._id_0318 _meth_833D();
        var_5 = var_4 == 1.0 || var_4 > var_1;
        var_6 = isdefined( var_3 ) && var_3 == "dragunov" && var_5;

        if ( var_6 && !var_2 )
            level._id_0318 _meth_83BF( var_0, 0 );
        else if ( !var_6 && var_2 )
            level._id_0318 _meth_83C0( 0 );

        var_2 = var_6;
        var_1 = var_4;
        wait 0.05;
    }
}

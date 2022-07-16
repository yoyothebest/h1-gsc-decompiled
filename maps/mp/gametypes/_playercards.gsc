// H1 GSC SOURCE
// Decompiled by https://github.com/xensik/gsc-tool

init()
{
    level thread _id_64C8();
}

_id_64C8()
{
    for (;;)
    {
        level waittill( "connected", var_0 );

        if ( !_func_0CF( var_0 ) )
        {
            var_1 = 0;
            var_2 = 0;
            var_3 = 0;

            if ( maps\mp\_utility::_id_4FA6() )
            {
                var_4 = var_0 _meth_8568();
                var_1 = _func_2FA( var_4, common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
                var_3 = _func_2FA( var_4, common_scripts\utility::getstatsgroup_common(), "applyEmblemToCharacter" );
                var_2 = _func_2FA( var_4, common_scripts\utility::getstatsgroup_common(), "callingCardIndex" );
            }
            else
            {
                var_1 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "emblemPatchIndex" );
                var_3 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "applyEmblemToCharacter" );
                var_2 = var_0 _meth_8226( common_scripts\utility::getstatsgroup_common(), "callingCardIndex" );
            }

            var_0._id_031C = var_1;
            var_0 _meth_8577( var_3 );
            var_0._id_031B = var_2;
        }
    }
}

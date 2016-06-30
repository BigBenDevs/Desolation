scriptName "initPlayerLocal";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: initPlayerLocal.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "initPlayerLocal.sqf"

// Disable saving
enableSaving[false,false];

if (hasInterface) then {
	player allowDamage false;
	[] spawn compile preprocessFileLineNumbers "client\fn_init_client.sqf";
};
//[] spawn compile preprocessFileLineNumbers "map.sqf";
MISSION_ROOT = call { private "_arr"; _arr = toArray __FILE__;_arr resize (count _arr - 19); toString _arr};
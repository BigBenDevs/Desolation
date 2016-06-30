if (isDedicated) exitWith {};scriptName "fn_items_Chemlight";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_Chemlight.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_Chemlight.sqf"

// Parameters
_item = param[0,"",[""]];

// Exceptions


// Code
_v = _item createVehicle (position player);
_v attachTo [vehicle player, [-0.1, 0.1, 0.15], "Pelvis"];
_v setVectorDirAndUp [ [0.5, 0.5, 0], [-0.5, 0.5, 0] ];
player setVariable ["chemlight",_v];
player removeItem _item;
call dz_fnc_playerMenuLoadInventory;
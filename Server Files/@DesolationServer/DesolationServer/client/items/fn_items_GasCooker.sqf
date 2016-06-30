if (isDedicated) exitWith {};scriptName "fn_items_GasCooker";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_GasCooker.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_GasCooker.sqf"

// Parameters


// Exceptions


// Code
_fireplace = "DayZero_Object_GasCooker" createVehicle position player;
_fireplace setPosATL getPosATL player;
player reveal _fireplace;

[[_fireplace],{
	(_this select 0) addAction ["Pick Up Gas Cooker",{
	deleteVehicle (_this select 0);
	player addItem "DayZero_Item_GasCooker"
	},nil,1.5,true,true,"","(player distance _target) < 2 AND (isNil {_target getVariable 'burning'})"];
}] remoteExec ["BIS_FNC_SPAWN"];

player removeItem (_this select 0);
["<t color='#A3FB26'>The gas cooker is on the ground</t>"] call dz_fnc_addToFeed;
call dz_fnc_playerMenuLoadInventory;
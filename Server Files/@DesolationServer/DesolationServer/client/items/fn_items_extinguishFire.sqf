if (isDedicated) exitWith {};scriptName "fn_items_extinguishFire";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_extinguishFire.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_extinguishFire.sqf"

// Parameters
_c = param[0,cursorTarget,[objNull]];
_c = typeOf _c;

// Exceptions
if (isNull cursortarget) exitWith {};

// Code
switch (_c) do {
	case "DayZero_Object_CampFire": {
		[cursorTarget,false] remoteExecCall ["dz_fnc_campfireEffect"];
		["<t color='#A3FB26'>I have extinguished the campfire</t>"] call dz_fnc_addToFeed;
	};
	case "DayZero_Object_GasCooker": {
		[cursorTarget,false] remoteExecCall ["dz_fnc_campfireEffect"];
		["<t color='#A3FB26'>I have extinguished the campfire</t>"] call dz_fnc_addToFeed;
	};
};
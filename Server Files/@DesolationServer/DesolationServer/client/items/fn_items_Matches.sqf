if (isDedicated) exitWith {};scriptName "fn_items_Matches";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_Matches.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_Matches.sqf"

// Parameters


// Exceptions


// Code

switch (typeOf cursortarget) do {
	case "DayZero_Object_CampFire": {
		if (isNil {cursortarget getVariable "burning"}) then {
			[cursorTarget,true] remoteExecCall ["dz_fnc_campfireEffect"];
			["<t color='#A3FB26'>I have lit the campfire</t>"] call dz_fnc_addToFeed;
			/*[[cursorTarget],{
				while {(!isNull (_this select 0)) AND (!isNil {(_this select 0) getVariable "burning"})} do {
					playsound3D ["DayZero\effects\campfire.ogg", (_this select 0)];
					uisleep 1;
				};
			}] remoteExec ["BIS_FNC_SPAWN",2];*/
		};
	};
	case "DayZero_Object_GasCooker": {
		if (isNil {cursortarget getVariable "burning"}) then {
			[cursorTarget,true] remoteExecCall ["dz_fnc_campfireEffect"];
			["<t color='#A3FB26'>I have lit the gas cooker</t>"] call dz_fnc_addToFeed;
			/*[[cursorTarget],{
				while {(!isNull (_this select 0)) AND (!isNil {(_this select 0) getVariable "burning"})} do {
					playsound3D ["DayZero\effects\gascooker.ogg", (_this select 0)];
					uisleep 0.7;
				};
			}] remoteExec ["BIS_FNC_SPAWN",2];*/
		};
	};
};

call dz_fnc_playerMenuLoadInventory;
if (isDedicated) exitWith {};scriptName "fn_items_CampfireKit";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_CampfireKit.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_CampfireKit.sqf"

// Parameters


// Exceptions


// Code
_fireplace = "DayZero_Object_CampFire" createVehicle position player;
_fireplace setPosATL getPosATL player;
player reveal _fireplace;

player removeItem (_this select 0);
["<t color='#A3FB26'>I have created a campfire</t>"] call dz_fnc_addToFeed;
call dz_fnc_playerMenuLoadInventory;
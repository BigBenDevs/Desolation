if (isDedicated) exitWith {};scriptName "fn_items_hatchet";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_hatchet.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_hatchet.sqf"

// Parameters


// Exceptions


// Code
closeDialog 0;
[] spawn {
	player say3D "z_chopwood_0";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	uisleep 6;
	dz_inAction = false;
	player addItem "DayZero_Item_Woodpile";
	["<t color='#A3FB26'>I have collected some wood</t>"] call dz_fnc_addToFeed;
	call dz_fnc_openPlayerMenu;
};
scriptName "fn_overwriteMapDialog";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_overwriteMapDialog.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_overwriteMapDialog.sqf"

// Parameters


// Exceptions
if (!hasInterface) exitWith {};

// Wait until the map is open
dz_overwriteMapDialog = true;
dz_openMapNow = false;

while {dz_overwriteMapDialog} do {
	waitUntil {(visibleMap OR dz_openMapNow) AND !dialog};
	dz_openMapNow = false;

	// Check if the player has a map
	if ("ItemMap" in (assignedItems player)) then {
		// Close normal map
		openMap [false,false];

		// Open custom map
		createDialog "playerMap";
	} else {
		closeDialog 0;
		["<t color='#AB0E00'>I do not have a map equipped</t>"] call dz_fnc_addToFeed;
	};

	waitUntil {!visibleMap};
};
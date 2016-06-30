if (isDedicated) exitWith {};scriptName "fn_items_Shovel";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_Shovel.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_Shovel.sqf"

// Parameters


// Exceptions
if (isDedicated) exitWith {};

// Code
closeDialog 0;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
//[player,"z_useShovel_0"] remoteExecCall ["say3D"];
dz_inAction = true;
[cursorTarget] spawn {
	uisleep 4.5;
	dz_inAction = false;
	deleteVehicle cursorTarget;
	["<t color='#A3FB26'>One less...</t>"] call dz_fnc_addToFeed;
};
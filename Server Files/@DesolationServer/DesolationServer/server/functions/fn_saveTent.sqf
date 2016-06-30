scriptName "fn_saveTent";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_saveTent.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_saveTent.sqf"

diag_log format ["===== DSL-SAVE-SCRIPT ====="];

// Parameters
_tent = param[0,objNull,[objNull]];

// Exceptions
if (isNull _tent) exitWith {
	diag_log format ["DSL-SAVE: Tent equals null, exiting..."];
	diag_log format ["==========================="];
};

// Code
_ID = _tent getVariable ["TentID",-1];


_posAndDir = [getPos _tent,getDir _tent];
_weapons = getWeaponCargo _tent;
_magazines = getMagazineCargo _tent;
_items = getItemCargo _tent;
_backpacks = getBackpackCargo _tent;

diag_log format ["DSL-SAVE: Saving tent %1 with %2 with posanddir %3 at ID %4",typeOf _tent,[true,str [_weapons,_magazines,_items,_backpacks]] call dz_fnc_prepareString,_posAndDir,_ID];
diag_log format ["==========================="];

_query = format[
	"UPDATE tents SET Type='%1',Inventory='%2',PosAndDir='%3' WHERE ID='%4'",
	typeOf _tent,
	[true,str [_weapons,_magazines,_items,_backpacks]] call dz_fnc_prepareString,
	str _posAndDir,
	_ID
];

[_query,1] call dz_fnc_asyncCall;
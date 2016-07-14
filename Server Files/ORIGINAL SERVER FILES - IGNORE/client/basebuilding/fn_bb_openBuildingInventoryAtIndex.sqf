scriptName "fn_bb_openBuildingInventoryAtIndex";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_bb_openBuildingInventoryAtIndex.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_bb_openBuildingInventoryAtIndex.sqf"

// Parameters
_building	= param[0,objNull,[objNull]];
_index		= param[1,-1,[0]];

// Exceptions
if (isNull _building) exitWith {systemChat "XIT"};
if (_index == -1) exitWith {};

// Code
_weaponHolder = ((_building getVariable ['dz_house_weaponholders',[objNull]]) select _index);
_weaponHolder setPosATL getPosATL player;
player action ['Gear', _weaponHolder];
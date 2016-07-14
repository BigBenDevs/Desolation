if (isDedicated) exitWith {};scriptName "fn_playerMenuUnload";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuUnload.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuUnload.sqf"
disableSerialization;

// Parameters
_CST = uiNamespace getVariable "playerMenu_CraftingItems";
_inv = uiNamespace getVariable "playerMenu_MyInventory";

// Exceptions

// Code

_array = dz_crafting_inv;
{
	_item = _x;

	if (player canAddItemToUniform _item OR player canAddItemToBackpack _item OR player canAddItemToVest _item) then {
		player addItem _item;
	} else {
		if (isNull dz_crafting_exitDummy OR player distance dz_crafting_exitDummy > 1) then {
			_wh = "groundweaponholder" createVehicle (position player);
			_wh setPosATL (position player);
			dz_crafting_exitDummy = _wh;
		};
		dz_crafting_exitDummy addWeaponCargoGlobal [_item,1];
	};
} forEach _array;

dz_crafting_inv = [];

// Delete blurry effect
0 = ["DynamicBlur", 400, [0]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		dz_playerMenuBlur = ppEffectCreate [_name, _priority];
		dz_playerMenuBlur < 0
	} do {
		_priority = _priority + 1;
	};
	dz_playerMenuBlur ppEffectEnable true;
	dz_playerMenuBlur ppEffectAdjust _effect;
	dz_playerMenuBlur ppEffectCommit 0.1;
};
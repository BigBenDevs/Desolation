if (isDedicated) exitWith {};scriptName "fn_playerMenuMoveItemToInventory";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuMoveItemToInventory.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuMoveItemToInventory.sqf"
disableSerialization;

// Parameters
_CST = uiNamespace getVariable "playerMenu_CraftingItems";
_inv = uiNamespace getVariable "playerMenu_MyInventory";

// Exceptions
if (!dialog) exitWith {};
if ((lbCurSel _CST) < 0) exitWith {call dz_fnc_playerMenuBtnAvailable};

// Code

// Get currently selected item and move it to the dummy
_item = _CST lbData (lbCurSel _CST);
dz_crafting_inv deleteAt (dz_crafting_inv find _item);

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

call dz_fnc_playerMenuLoadCrafting;
call dz_fnc_playerMenuLoadInventory;
call dz_fnc_playerMenuBtnAvailable;
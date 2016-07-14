if (isDedicated) exitWith {};scriptName "fn_playerMenuMoveItemToCrafting";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuMoveItemToCrafting.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuMoveItemToCrafting.sqf"
disableSerialization;

// Parameters
_CST = uiNamespace getVariable "playerMenu_CraftingItems";
_inv = uiNamespace getVariable "playerMenu_MyInventory";

// Exceptions
if (!dialog) exitWith {};
if ((lbCurSel _inv) < 0) exitWith {call dz_fnc_playerMenuBtnAvailable};

// Code

// Get currently selected item and move it to the dummy
_item = _inv lbData (lbCurSel _inv);
if (_item == (handgunWeapon player)) exitWith {};
player removeItem _item;
dz_crafting_inv pushBack _item;

call dz_fnc_playerMenuLoadCrafting;
call dz_fnc_playerMenuLoadInventory;
call dz_fnc_playerMenuBtnAvailable;
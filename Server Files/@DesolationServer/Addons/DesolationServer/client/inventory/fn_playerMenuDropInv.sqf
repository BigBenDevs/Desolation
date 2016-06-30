if (isDedicated) exitWith {};scriptName "fn_playerMenuDropInv";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuDropInv.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuDropInv.sqf"

// Parameters
_item = ((_this select 4) select 0) select 2;
disableSerialization;
_crafting = uiNamespace getVariable "playerMenu_CraftingItems";
_inv = uiNamespace getVariable "playerMenu_MyInventory";

// Exceptions
if (!dialog) exitWith {};

// Code
_index = -1;
for "_i" from 0 to (lbSize _crafting - 1) step 1 do
{
	if ((_crafting lbData _i) == _item) exitWith {_index = _i};
};
_crafting lbSetCurSel _index;

call dz_fnc_playerMenuMoveItemToInventory;
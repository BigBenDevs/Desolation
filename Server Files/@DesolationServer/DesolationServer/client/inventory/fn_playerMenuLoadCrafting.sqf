if (isDedicated) exitWith {};scriptName "fn_playerMenuLoadCrafting";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuLoadCrafting.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuLoadCrafting.sqf"
disableSerialization;

// Parameters


// Exceptions
if (!dialog) exitWith {};

// Code
_listbox = uiNamespace getVariable "playerMenu_CraftingItems";

// Get Items
_items = dz_crafting_inv;

// Get Selected Index
_index = lbCurSel _listbox;

// Clear Listbox
lbClear _listbox;

// Load into Listbox
{
	_item = _x;
	_itemInfo = ([_item] call dz_fnc_itemDetails);
	_displayName = _itemInfo select 1;
	_displayPicture = _itemInfo select 2;

	_listbox lbAdd _displayName;
	_listbox lbSetData [(lbSize _listbox)-1,_item];
	_listbox lbSetPicture [(lbSize _listbox)-1,_displayPicture];
} forEach _items;

// Set Selected Index
_listbox lbSetCurSel _index;
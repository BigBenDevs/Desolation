if (isDedicated) exitWith {};scriptName "fn_playerMenuLoadInventory";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuLoadInventory.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuLoadInventory.sqf"
disableSerialization;

// Parameters


// Exceptions
if (!dialog) exitWith {};

// Code
_listbox = uiNamespace getVariable "playerMenu_MyInventory";

// Load status of player
_data = [
	[0,[1,0,0,0.6]],
	[25,[0.6,0.3,0,0.6]],
	[50,[0.41,0.45,0,0.6]],
	[75,[0,0.61,0.09,0.6]],
	[100,[0,0.61,0.09,0.6]]
];

_color = [0,0,0,0];
{
	if ((dz_hunger) >= (_x select 0)) then {
		_color = _x select 1;
	};
} forEach _data;
(uiNamespace getVariable "playerMenu_hungerBackground") ctrlSetBackgroundColor _color;

_color = [0,0,0,0];
{
	if ((dz_thirst) >= (_x select 0)) then {
		_color = _x select 1;
	};
} forEach _data;
(uiNamespace getVariable "playerMenu_thirstBackground") ctrlSetBackgroundColor _color;

_color = [0.36,0.36,0.36,0.6];
if (dz_brokenLegs) then {
	_color = [1,0,0,0.6];
};
(uiNamespace getVariable "playerMenu_legsBackground") ctrlSetBackgroundColor _color;

_color = [0.36,0.36,0.36,0.6];
if (dz_infected) then {
	_color = [1,0,0,0.6];
};
(uiNamespace getVariable "playerMenu_sickBackground") ctrlSetBackgroundColor _color;

_color = [0.36,0.36,0.36,0.6];
if (player getVariable ["bleeding",false]) then {
	_color = [1,0,0,0.6];
};
(uiNamespace getVariable "playerMenu_bleedingBackground") ctrlSetBackgroundColor _color;

_color = [0.36,0.36,0.36,0.6];
if (dz_hunger < 25) then {
	_color = [1,0,0,0.6];
};
(uiNamespace getVariable "playerMenu_starvationBackground") ctrlSetBackgroundColor _color;

_color = [0.36,0.36,0.36,0.6];
if (dz_thirst < 25) then {
	_color = [1,0,0,0.6];
};
(uiNamespace getVariable "playerMenu_dehydrationBackground") ctrlSetBackgroundColor _color;


// Get Items
_items = [];
_items = _items + uniformItems player;
_items = _items + backpackItems player;
_items = _items + vestITems player;

// Get Selected Index
_index = lbCurSel _listbox;

// Clear Listbox
lbClear _listbox;

// Delete duplicates
_preparedItemsString = [];
{
	_curItem = _x;
	if (({(_x select 0) == _curItem} count _preparedItemsString) == 0) then {
		_preparedItemsString pushBack [_curItem,1];
	} else {
		_index = -1;
		{
			_index = _index + 1;
			if ((_x select 0) == _curItem) exitWith {};
		} forEach _preparedItemsString;

		_preparedItemsString set [_index,[((_preparedItemsString select _index) select 0),((_preparedItemsString select _index) select 1) + 1]];
	};
} forEach _items;

if (handgunWeapon player != "") then {
	_preparedItemsString pushBack [handgunWeapon player,1];
};

// Load into Listbox
{
	if ((getNumber(configfile >> "CfgMagazines" >> (_x select 0) >> "count")) <= 1) then {
		_item = _x select 0;
		_itemCount = _x select 1;
		_itemInfo = ([_item] call dz_fnc_itemDetails);
		_displayName = _itemInfo select 1;
		_displayPicture = _itemInfo select 2;

		_listbox lbAdd format ["%1x %2",_itemCount,_displayName];
		_listbox lbSetData [(lbSize _listbox)-1,_item];
		_listbox lbSetPicture [(lbSize _listbox)-1,_displayPicture];
	};
} forEach _preparedItemsString;

// Set Selected Index
_listbox lbSetCurSel _index;
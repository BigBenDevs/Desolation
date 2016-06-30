scriptName "fn_displayRandomRecipe";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_displayRandomRecipe.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_displayRandomRecipe.sqf"

// Parameters
_myItem = param[0,"",[""]];

// Exceptions
if (_myItem == "") exitWith {};

// Code
_r = 0.33;
if ((random 1) <= _r) then {
	_recipeToDisplay = ["DayZero_Item_Bandage",[]];
	while {((_recipeToDisplay select 0) == "DayZero_Item_Bandage") OR ((_recipeToDisplay select 0) == "")} do {
		_recipeToDisplay = dz_crafting_items call BIS_FNC_selectRandom;
	};

	createDialog "craftingRecipeFound";
	_ctrls = uiNamespace getVariable "dz_recipeResult";
	_items = _ctrls select 0;
	_tools = _ctrls select 1;
	_product = _ctrls select 2;

	_itemsText = "";
	_toolsText = "";

	player removeItem _myItem;
	[] spawn dz_fnc_playerMenuLoadInventory;

	// Items
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
	} forEach (_recipeToDisplay select 2);
	{
		_displayName = (([_x select 0] call dz_fnc_itemDetails) select 1);
		_itemsText = _itemsText + format["<t font='Roboto'>%2x %1</t><br/>",_displayName,_x select 1];
	} forEach _preparedItemsString;

	// Tools
	{
		if (_x == "Water") then {
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>","Water"];
		};
		if (_x == "Fire") then {
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>","Fire"];
		};
		if (_x == "SharpObject") then {
			_displayName = getText(configFile >> "CfgMagazines" >> "DayZero_Item_Knife" >> "displayName");
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>",_displayName];
		};
		if (_x == "Shovel") then {
			_displayName = getText(configFile >> "CfgMagazines" >> "DayZero_Item_Shovel" >> "displayName");
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>",_displayName];
		};
		if (_x == "Wrench") then {
			_displayName = getText(configFile >> "CfgMagazines" >> "DayZero_Item_Toolbox" >> "displayName");
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>",_displayName];
		};
		if (_x == "ButaneTorch") then {
			_displayName = getText(configFile >> "CfgMagazines" >> "DayZero_Item_ButaneTorch" >> "displayName");
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>",_displayName];
		};
		if (_x == "DrillAku") then {
			_displayName = getText(configFile >> "CfgMagazines" >> "DayZero_Item_DrillAku" >> "displayName");
			_toolsText = _toolsText + format["<t font='Roboto'>%1</t><br/>",_displayName];
		};
	} forEach (_recipeToDisplay select 1);

	// Product
	_productText = "<t font='Roboto'>" + (([(_recipeToDisplay select 0)] call dz_fnc_itemDetails) select 1) + "</t>";

	// Output
	_items ctrlSetStructuredText parseText _itemsText;
	_tools ctrlSetStructuredText parseText _toolsText;
	_product ctrlSetStructuredText parseText _productText;
} else {
	["<t color='#E00600'>This paper didn't include anything useful...</t>"] spawn dz_fnc_addToFeed;
	player removeItem _myItem;
	[] spawn dz_fnc_playerMenuLoadInventory;
};
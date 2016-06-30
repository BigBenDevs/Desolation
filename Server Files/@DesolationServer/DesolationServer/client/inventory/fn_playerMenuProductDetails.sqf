if (isDedicated) exitWith {};scriptName "fn_playerMenuProductDetails";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuProductDetails.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuProductDetails.sqf"

// Parameters
_products = uiNamespace getVariable "playerMenu_PossibleProducts";
_text = uiNamespace getVariable "playerMenu_CraftingRequirements";

// Exceptions
if (!dialog) exitWith {};

// Code
if ((lbCurSel _products) < 0) exitWith {
	_text ctrlSetStructuredText parseText "";
};

_item = _products lbData (lbCurSel _products);

if (isNil "dz_productArray") then {dz_productArray = [];};

//_productArray = dz_productArray;

_productArray = [];
{
	if ((_x select 0) == _item) then {
		_productArray = _x;
	};
} forEach dz_productArray;

if (count _productArray > 0) then {
	//_str = "<t color='#3DB300' size='1.3'></t>";
	_str = "";
	{
		if (_x == "Water") then {
			_str = _str + "Water, ";
		};
		if (_x == "Fire") then {
			_str = _str + "Fire, ";
		};
		if (_x == "SharpObject") then {
			_str = _str + "Sharp Object, ";
		};
		if (_x == "Shovel") then {
			_str = _str + "Shovel, ";
		};
	} forEach (_productArray select 1);

	_usedItems = [];
	{
		if !(_x in _usedItems) then {
			_str = _str + (([_x] call dz_fnc_itemDetails) select 1) + ", ";
			_usedItems pushBack _x;
		};
	} forEach (_productArray select 2);

	_text ctrlSetStructuredText parseText format ["<t color='#3DB300' shadow='2' font='PuristaSemibold' size='0.65'>%1</t>",_str];
} else {
	_text ctrlSetStructuredText parseText "";
};

call dz_fnc_playerMenuBtnAvailable;
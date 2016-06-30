if (isDedicated) exitWith {};scriptName "fn_playerMenuBtnAvailable";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuBtnAvailable.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuBtnAvailable.sqf"
disableSerialization;

// Parameters


// Exceptions
if (!dialog) exitWith {};

// Code
_btn1 = uiNamespace getVariable "playerMenu_BtnUseItem";
_btn2 = uiNamespace getVariable "playerMenu_BtnCraftItem";
_btn3 = uiNamespace getVariable "playerMenu_BtnAddResource";
_btn4 = uiNamespace getVariable "playerMenu_BtnClearResource";

_inv = uiNamespace getVariable "playerMenu_MyInventory";
_item = _inv lbData (lbCurSel _inv);

if ((lbCurSel _inv) < 0) then {
	//_btn1 ctrlSetBackgroundColor [0.53,0.53,0.53,1];
	//_btn3 ctrlSetBackgroundColor [0.53,0.53,0.53,1];
	_btn1 ctrlEnable false;
	_btn3 ctrlEnable false;
} else {
	//_btn1 ctrlSetBackgroundColor [0.3,0,0,1];
	//_btn3 ctrlSetBackgroundColor [0.3,0,0,1];
	_useable = false;
	_condition = false;
	{
		if ((_x select 0) == _item) then {
			_useable = true;
			if (call (_x select 2)) then {
				_condition = true;
			};
		};
	} forEach dz_useableItems;
	if (_useable AND _condition) then {_btn1 ctrlEnable true;} else {_btn1 ctrlEnable false;};
	_btn3 ctrlEnable true;
};

_CST = uiNamespace getVariable "playerMenu_CraftingItems";
if ((lbCurSel _CST) < 0) then {
	//_btn4 ctrlSetBackgroundColor [0.53,0.53,0.53,1];
	_btn4 ctrlEnable false;
} else {
	//_btn4 ctrlSetBackgroundColor [0.3,0,0,1];
	_btn4 ctrlEnable true;
};

_products = uiNamespace getVariable "playerMenu_PossibleProducts";
if ((lbCurSel _products) < 0) then {
	_btn2 ctrlEnable false;
} else {
	_btn2 ctrlEnable true;
};
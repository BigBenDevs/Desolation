if (isDedicated) exitWith {};scriptName "fn_openPlayerMenu";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_openPlayerMenu.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_openPlayerMenu.sqf"
disableSerialization;

// Parameters


// Exceptions
if (dialog) exitWith {};

// Make screen background blurry

0 = ["DynamicBlur", 400, [5]] spawn {
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

// Code
[] spawn {
	disableSerialization;
	uisleep 0.1;

	createDialog "playerMenu";
	if (!dialog) exitWith {};

	// Create vars for all scripts to use without searching for the dialog..
	_display = findDisplay 500;
	uiNamespace setVariable ["playerMenu_PossibleProducts",(_display displayCtrl 1)];
	uiNamespace setVariable ["playerMenu_CraftingRequirements",(_display displayCtrl 3)];
	uiNamespace setVariable ["playerMenu_CraftingItems",(_display displayCtrl 4)];
	uiNamespace setVariable ["playerMenu_MyInventory",(_display displayCtrl 5)];
	uiNamespace setVariable ["playerMenu_BtnUseItem",(_display displayCtrl 6)];
	uiNamespace setVariable ["playerMenu_BtnCraftItem",(_display displayCtrl 10)];
	uiNamespace setVariable ["playerMenu_BtnAddResource",(_display displayCtrl 7)];
	uiNamespace setVariable ["playerMenu_BtnClearResource",(_display displayCtrl 8)];
	uiNamespace setVariable ["playerMenu_hungerBackground",(_display displayCtrl 20)];
	uiNamespace setVariable ["playerMenu_thirstBackground",(_display displayCtrl 21)];
	uiNamespace setVariable ["playerMenu_legsBackground",(_display displayCtrl 22)];
	uiNamespace setVariable ["playerMenu_sickBackground",(_display displayCtrl 23)];
	uiNamespace setVariable ["playerMenu_bleedingBackground",(_display displayCtrl 24)];
	uiNamespace setVariable ["playerMenu_starvationBackground",(_display displayCtrl 25)];
	uiNamespace setVariable ["playerMenu_dehydrationBackground",(_display displayCtrl 26)];

	call dz_fnc_playerMenuLoadInventory;
	call dz_fnc_playerMenuLoadCrafting;
	call dz_fnc_playerMenuBtnAvailable;
};
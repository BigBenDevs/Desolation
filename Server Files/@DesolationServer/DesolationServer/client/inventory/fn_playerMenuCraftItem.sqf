if (isDedicated) exitWith {};scriptName "fn_playerMenuCraftItem";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuCraftItem.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuCraftItem.sqf"

// Parameters
_products = uiNamespace getVariable "playerMenu_PossibleProducts";

// Exceptions
if (!dialog) exitWith {};

// Code
if ((lbCurSel _products) < 0) exitWith {};

_item = _products lbData (lbCurSel _products);

_productArray = [];
{
	if ((_x select 0) == _item) then {
		_productArray = _x;
	};
} forEach dz_productArray;

if (count _productArray > 0) then {
	if (player canAddItemToUniform (_productArray select 0) OR player canAddItemToBackpack (_productArray select 0) OR player canAddItemToVest (_productArray select 0)) then {
		player addItem (_productArray select 0);
	} else {
		if (isNull dz_crafting_exitDummy OR player distance dz_crafting_exitDummy > 1) then {
			_wh = "groundweaponholder" createVehicle (position player);
			_wh setPosATL (position player);
			dz_crafting_exitDummy = _wh;
		};
		dz_crafting_exitDummy addWeaponCargoGlobal [(_productArray select 0),1];
	};

	{
		dz_crafting_inv deleteAt (dz_crafting_inv find _x);
	} ForEach (_productArray select 2);

	if ((_productArray select 3) != "") then {
		//player say3D (_productArray select 3);
		[[player,(_productArray select 3)],{(_this select 0) say3D (_this select 1)}] remoteExecCall ["BIS_FNC_SPAWN"];
	};

	//hint parseText format ["You have crafted a<br/><br/>%1",(_productArray select 0)],
};

dz_productArray = [];

if ((_productArray select 4)) then {
	_productArray spawn {
		closeDialog 0;
		if (vehicle player == player) then {player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";};
		dz_inAction = true;
		uisleep 5;
		dz_inAction = false;
		call dz_fnc_openPlayerMenu;
		["<t color='#3D9E01'>I have crafted: " + (([(_this select 0)] call dz_fnc_itemDetails) select 1) + "</t>"] call dz_fnc_addToFeed;
	};
} else {
	call dz_fnc_playerMenuLoadInventory;
	call dz_fnc_playerMenuLoadCrafting;
	call dz_fnc_playerMenuBtnAvailable;
	call dz_fnc_playerMenuCraftingProducts;
	call dz_fnc_playerMenuProductDetails;
};

[] spawn {
	uisleep 0.1;
	call dz_fnc_playerMenuLoadInventory;
	call dz_fnc_playerMenuLoadCrafting;
	call dz_fnc_playerMenuBtnAvailable;
	call dz_fnc_playerMenuCraftingProducts;
	call dz_fnc_playerMenuProductDetails;
};
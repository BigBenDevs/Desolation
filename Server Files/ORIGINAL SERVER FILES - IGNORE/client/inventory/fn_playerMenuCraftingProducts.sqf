if (isDedicated) exitWith {};scriptName "fn_playerMenuCraftingProducts";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuCraftingProducts.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuCraftingProducts.sqf"
disableSerialization;

// Parameters
_CST = uiNamespace getVariable "playerMenu_CraftingItems";
_products = uiNamespace getVariable "playerMenu_PossibleProducts";

// Exceptions
if (!dialog) exitWith {};
lbClear _products;
if ((lbCurSel _CST) < 0) exitWith {};

dz_productArray = [];

// Code
_item = _CST lbData (lbCurSel _CST);

{
	_curRecipe = _x;
	// Get Information of possible product
	_product = "";
	_productArray = [];

	if (_item in (_x select 2)) then {
		_productArray = _x;
	};

	// Check
	if (count _productArray > 0) then {
		//systemChat str _curRecipe;

		_product = (_productArray select 0);
		_productOtherRequirements = (_productArray select 1);
		_productRequirements = (_productArray select 2);

		// Check for requirements
		_allItemsNeededPresent = true;

		if !([_productArray select 2,dz_crafting_inv,true,true] call dz_fnc_sameArrays) then {
			_allItemsNeededPresent = false;
		};

		// Check further..
		if (_allItemsNeededPresent) then {
			// Check for other requirements
			_allRequirementsMet = true;
			{
				_nearObjects = nearestObjects [position player, ["Land_Pumpa","Land_Misc_WellPump","xcam_Misc_WellPump","Land_water_pump"], 5];
				if (_x == "Water") then {
					if (!surfaceIsWater (getPosATL player)) then {
						if (count _nearObjects < 1) then {
							_allRequirementsMet = false;
						} else {
							if ((player distance (_nearObjects select 0)) > 5) then {
								_allRequirementsMet = false;
							};
						};
					};

					_nearObjects = nearestObjects [player, [], 5];
					//systemChat str _nearObjects;
					{
						if (["wellpump",str _x] call BIS_FNC_inString) then {
							_allRequirementsMet = true;
						};
					} forEach _nearObjects;
				};

				// Additional checks
				_a = (vestItems player) + (backpackITems player) + (uniformItems player);
				if (_x == "Fire") then {
					_obj = nearestObject [player, "DayZero_Object_CampFire"];
					_ob2 = nearestObject [player, "DayZero_Object_GasCooker"];
					if ((player distance _obj > 2 OR isNil {_obj getVariable "burning"}) AND (player distance _ob2 > 2 OR isNil {_ob2 getVariable "burning"})) then {
						_allRequirementsMet = false;
					};
				};
				if (_x == "SharpObject") then {
					if !("DayZero_Item_Knife" in _a) then {
						_allRequirementsMet = false;
					};
				};
				if (_x == "Shovel") then {
					if !("DayZero_Item_Shovel" in _a) then {
						_allRequirementsMet = false;
					};
				};
				if (_x == "Wrench") then {
					if !("DayZero_Item_Toolbox" in _a) then {
						_allRequirementsMet = false;
					};
				};
				if (_x == "ButaneTorch") then {
					if !("DayZero_Item_ButaneTorch" in _a) then {
						_allRequirementsMet = false;
					};
				};
				if (_x == "DrillAku") then {
					if !("DayZero_Item_DrillAku" in _a) then {
						_allRequirementsMet = false;
					};
				};
			} forEach _productOtherRequirements;

			if (_allRequirementsMet) then {
				_itemProduct = _product;
				_itemInfo = ([_itemProduct] call dz_fnc_itemDetails);
				_displayName = _itemInfo select 1;
				_displayPicture = _itemInfo select 2;

				_products lbAdd _displayName;
				_products lbSetData [(lbSize _products)-1,_itemProduct];
				_products lbSetPicture [(lbSize _products)-1,_displayPicture];
				dz_productArray pushBack _productArray;
			};
		};
	};
} forEach dz_crafting_items;

call dz_fnc_playerMenuProductDetails;
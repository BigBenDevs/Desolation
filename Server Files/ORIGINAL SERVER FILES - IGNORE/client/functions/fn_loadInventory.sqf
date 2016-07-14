if (isDedicated) exitWith {};scriptName "fn_loadInventory";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_loadInventory.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadInventory.sqf"

// Parameters
_inventoryToLoad = param[0,dz_Inventory,[[]]];

// Exceptions
if (count _inventoryToLoad == 0) exitWith {};

// Code
removeAllWeapons player;
removeUniform player;
removeGoggles player;
removeAllItems player;
removeBackpackGlobal player;
removeVest player;
removeHeadgear player;
removeAllAssignedItems player;

// [[Uniform, Backpack, Vest, Goggles, Headgear],[Uniformitems, Backpackitems, Vestitems],[primaryWeapon,[ITEMS WEAPON],Current Magazine)],[secondary,[ITEMS WEAPONS],Current Magazine],[assignedItems],[handugn,[ITEMS WEAPONS],Current Magazine]]

// Add clothes
_clothes = _inventoryToLoad select 0;
player forceAddUniform (_clothes select 0);
player addBackpackGlobal (_clothes select 1);
player addVest (_clothes select 2);
player addGoggles (_clothes select 3);
player addHeadgear (_clothes select 4);

// Assign items
{
	player addItem _x;
	player assignItem _x;
} forEach (_inventoryToLoad select 4);

// Add weapons (primary)
_primaryArray = _inventorytoLoad select 2;
if ((count (_primaryArray select 2)) > 0) then {
	player addMagazine ((_primaryArray select 2) select 0);
};
if ((_primaryArray select 0) != "") then {player addWeapon (_primaryArray select 0);};
{
	player addPrimaryWeaponItem _x;
} forEach (_primaryArray select 1);

// Add secondary weapon
_secondaryArray = _inventorytoLoad select 3;
//if ((count (_secondaryArray select 2)) > 0) then {
//	player addMagazine ((_secondaryArray select 2) select 0);
//};

_secondaryClassname = [_secondaryArray,0,"",[""]] call BIS_fnc_param;
if (_secondaryClassname != "") then {
	player addMagazine (([_secondaryClassname] call dz_fnc_itemDetails select 7) select 0);
};
if ((_secondaryArray select 0) != "") then {player addWeapon (_secondaryArray select 0);};
{
	player addSecondaryWeaponItem _x;
} forEach (_secondaryArray select 1);

// Add handgun weapon
_handgunArray = [_inventorytoLoad,5,[],[[]]] call BIS_fnc_param;
//if ((count ([_handgunArray,2,[],[[]]] call BIS_fnc_param)) > 0) then {
//	player addMagazine ((_handgunArray select 2) select 0);
//};

_handgunClassname = [_handgunArray,0,"",[""]] call BIS_fnc_param;
if (_handgunClassname != "") then {
	player addMagazine (([_handgunClassname] call dz_fnc_itemDetails select 7) select 0);
};

if (([_handgunArray,0,"",[""]] call BIS_fnc_param) != "") then {player addWeapon (_handgunArray select 0);};
{
	player addhandgunItem _x;
} forEach ([_handgunArray,1,[],[[]]] call BIS_fnc_param);


// Add items
_items = (_inventoryToLoad select 1);
{
	player addItemToUniForm _x;
} forEach (_items select 0);
{
	player addItemToBackpack _x;
} forEach (_items select 1);
{
	player addItemToVest _x;
} forEach (_items select 2);

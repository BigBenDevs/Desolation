if (isDedicated) exitWith {};scriptName "fn_saveInventory";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_saveInventory.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_saveInventory.sqf"

// Parameters


// Exceptions


// Code


// [Uniform, Backpack, Vest, Goggles, Headgear],[Uniformitems, Backpackitems, Vestitems],[primaryWeapon,[ITEMS WEAPON],Current Magazine)],[secondary,[ITEMS WEAPONS],Current Magazine]

call dz_fnc_getWeapons; // Get primary and secondary weapon classnames

_myInventory = [];
_myInventory pushBack [uniform player, backpack player, vest player, goggles player, headgear player];
_myInventory pushback [uniformItems player, backpackItems player, vestItems player];
_myInventory pushBack [dz_primaryWeapon,primaryWeaponItems player,(primaryWeaponMagazine player)];
_myInventory pushback [dz_secondaryWeapon,secondaryWeaponItems player,(secondaryWeaponMagazine player)];
_myInventory pushBack (assignedItems player);
_myInventory pushBack [dz_handgunWeapon,handgunItems player,(handgunMagazine player)];

dz_Inventory = _myInventory;

true
if (isDedicated) exitWith {};scriptName "fn_getWeapons";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_getWeapons.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_getWeapons.sqf"

// Parameters


// Exceptions


// Code
/*_weapons = weapons player;

_uniformItems = uniformItems player;
_backpackItems = backpackItems player;
_vestItems = vestItems player;

_weaponsRemaining = _weapons;
{
	if (_x in _uniformItems) then {
		_uniformItems deleteAt (_uniformItems find _x);
		_weaponsRemaining deleteAt (_weaponsRemaining find _x);
	};
	if (_x in _backpackItems) then {
		_backpackItems deleteAt (_backpackItems find _x);
		_weaponsRemaining deleteAt (_weaponsRemaining find _x);
	};
	if (_x in _vestItems) then {
		_vestItems deleteAt (_vestItems find _x);
		_weaponsRemaining deleteAt (_weaponsRemaining find _x);
	};
} forEach _weapons;

dz_primaryWeapon = "";
dz_secondaryWeapon = "";

{
	if ((getText(configFile >> "CfgWeapons" >> _x >> "cursor")) == "hgun") then {
		if (secondaryWeapon player == "") then {
			dz_secondaryWeapon = _x;
		} else {
			dz_secondaryWeapon = secondaryWeapon player;
		};
	};

	if ((getText(configFile >> "CfgWeapons" >> _x >> "cursor")) == "arifle") then {
		if (primaryWeapon player == "") then {
			dz_primaryWeapon = _x;
		} else {
			dz_primaryWeapon = primaryWeapon player;
		};
	};
} forEach _weaponsRemaining;

if (primaryWeapon player != "") then {
	dz_primaryWeapon = primaryWeapon player;
};
if (secondaryWeapon player != "") then {
	dz_secondaryWeapon = secondaryWeapon player;
};*/

////////////////////////
// ABOVE CODE OBSOLETE
////////////////////////

dz_primaryWeapon = primaryWeapon player;
dz_secondaryWeapon = secondaryWeapon player;
dz_handgunWeapon = handgunWeapon player;
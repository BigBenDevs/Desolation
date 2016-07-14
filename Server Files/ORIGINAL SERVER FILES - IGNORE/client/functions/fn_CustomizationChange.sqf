if (isDedicated) exitWith {};scriptName "fn_CustomizationChange";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_CustomizationChange.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_CustomizationChange.sqf"

// Parameters
_type = param[0,-1,[0]];

// Exceptions
if (_type == -1) exitWith {};

// Code
if (_type == 0) then {
	dz_clothingMenuIndex = dz_clothingMenuIndex + 1;
	if (dz_clothingMenuIndex >= (count dz_clothes)) then {dz_clothingMenuIndex = 0};
	_classname = dz_clothes select dz_clothingMenuIndex;
	player forceAddUniform _classname;
};
if (_type == 1) then {
	dz_glassesMenuIndex = dz_glassesMenuIndex + 1;
	if (dz_glassesMenuIndex >= (count dz_glasses)) then {dz_glassesMenuIndex = 0};
	if ((dz_glasses select dz_glassesMenuIndex) == "") then {
		removeGoggles player;
	} else {
		player addGoggles (dz_glasses select dz_glassesMenuIndex);
	};
};

if (_type == 2) then {
	dz_headGearMenuIndex = dz_headGearMenuIndex + 1;
	if (dz_headGearMenuIndex >= (count dz_headGear)) then {dz_headGearMenuIndex = 0};
	if ((dz_headGear select dz_headGearMenuIndex) == "") then {
		removeHeadgear player;
	} else {
		player addHeadgear (dz_headGear select dz_headGearMenuIndex);
	};
};
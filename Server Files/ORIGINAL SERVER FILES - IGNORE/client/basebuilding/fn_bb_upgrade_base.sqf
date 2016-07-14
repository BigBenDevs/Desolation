if (isDedicated) exitWith {};scriptName "fn_bb_upgrade_base";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_bb_upgrade_base.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_bb_upgrade_base.sqf"

// Parameters
_deployable = param[0,"",[""]];

// Exceptions
if (_deployable == "") exitWith {};

// Code
_baseLevel = cursorObject getVariable "BuildingLevel";
_level = _baseLevel + 1;

if (_level == 2) then {
	cursorObject animate ["level_2_hide",0,true];
	cursorObject animate ["level_3_hide",1,true];
};
if (_level == 3) then {
	cursorObject animate ["level_2_hide",0,true];
	cursorObject animate ["level_3_hide",0,true];
};

["<t color='#A3FB26'>I have upgraded a building</t>"] call dz_fnc_addToFeed;
cursorObject setVariable ["BuildingLevel",_level,true];
[cursorObject] remoteExec ["dz_fnc_saveBuilding",2];
player removeItem _deployable;
closeDialog 0;
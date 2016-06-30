if (isDedicated) exitWith {};scriptName "fn_savePlayerData";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_savePlayerData.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_savePlayerData.sqf"

// Parameters


// Exceptions
if (isNil "dz_inGame") exitWith {};

// Code
if (!alive player) exitWith {
	_nil = call dz_fnc_saveInventory;
	dz_TimeSurvived = dz_TimeSurvived + (diag_tickTime - dz_lastTimeCheck);
	_finalPlayerData = [[getPosATL player,getDir player,damage player],dz_Inventory,alive player,[dz_hunger,dz_thirst,0],0,0];
	[_finalPlayerData,player] remoteExec ["dz_fnc_savePlayerToDatabase",2];

	// Reset Game Count
	dz_lastTimeCheck = diag_tickTime;
};
_nil = call dz_fnc_saveInventory;
dz_TimeSurvived = dz_TimeSurvived + (diag_tickTime - dz_lastTimeCheck);
_finalPlayerData = [[getPosATL player,getDir player,damage player],dz_Inventory,alive player,[dz_hunger,dz_thirst,if (dz_brokenLegs) then {1} else {0},if (dz_infected) then {1} else {0}],round(dz_TimeSurvived),dz_ZombiesKilled];
[_finalPlayerData,player] remoteExec ["dz_fnc_savePlayerToDatabase",2];

systemChat "Your playerdata has been synced with the database";

// Reset Game Count
dz_lastTimeCheck = diag_tickTime;
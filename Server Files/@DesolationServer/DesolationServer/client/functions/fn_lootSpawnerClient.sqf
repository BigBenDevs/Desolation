if (isDedicated) exitWith {};scriptName "fn_lootSpawnerClient";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_lootSpawnerClient.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_lootSpawnerClient.sqf"

// Parameters


// Exceptions


// Code
dz_buildings = nearestObjects [player, (["house"] + dz_sv_customLootSpots_types), 60];
{
	uiSleep 0.2;
	_buildingNow = _x;
	_positions = [_buildingNow] call dz_fnc_core_getBuildingPos;
	if (count _positions > 0) then {
		if ((serverTime - (_buildingNow getVariable ["dz_timeSinceLastLootSpawn",-10000])) > 900) then
		{
			_weaponHolders = _buildingNow getVariable ["lootSpots",[]];
			_buildingNow setVariable ["lootSpots",[]];
			{deleteVehicle _x} forEach _weaponHolders;
			_buildingNow setVariable ["dz_timeSinceLastLootSpawn",serverTime,true];
			{
				_v = [_x,_buildingNow] call dz_fnc_core_createLootPile;
			} forEach _positions;
		};
	};
} forEach dz_buildings;
scriptName "fn_lootSpawner";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_lootSpawner.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_lootSpawner.sqf"

// Parameters


// Exceptions


// Code MOVED TO PLAYER
/*_updateCounter = 0;
dz_spawnLoot = true;
while {dz_spawnLoot} do {
	{
		dz_buildings = (position player) nearObjects ["House", 200];
		{
			_buildingNow = _x;
			_positions = [_buildingNow] call dz_fnc_getBuildingPos;
			if (count _positions > 0) then {
				if ((diag_tickTime - (_buildingNow getVariable ["dz_timeSinceLastLootSpawn",-10000])) > 900) then
				{
					_weaponHolders = _buildingNow getVariable ["lootSpots",[]];
					_buildingNow setVariable ["lootSpots",[]];
					{deleteVehicle _x} forEach _weaponHolders;
					_buildingNow setVariable ["dz_timeSinceLastLootSpawn",diag_tickTime,true];
					{
						_v = [_x,_buildingNow] call dz_fnc_createLootPile;
					} forEach _positions;
				};
			};
		} forEach dz_buildings;
		_updateCounter = _updateCounter + 1;
	uisleep 10;
};*/
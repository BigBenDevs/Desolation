if (isDedicated) exitWith {};scriptName "fn_zombieSpawnerClient";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_zombieSpawnerClient.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_zombieSpawnerClient.sqf"

// Parameters

// Exceptions
if (isDedicated) exitWith {};

// Code
dz_cl_spawnZombies = true;
dz_cl_blackListedPositions = [];
while {dz_cl_spawnZombies} do {
	dz_zombieSpawner_DataToSend = [];
	uiSleep 30;

	// Delete not used blacklisted positions anymore
	_tmpBlacklisted = [];
	{
		if ((diag_tickTime - (_x select 1)) < 600) then {
			_tmpBlacklisted pushBack [(_x select 0),(_x select 1)];
		};
	} forEach dz_cl_blackListedPositions;
	dz_cl_blackListedPositions = _tmpBlacklisted;

	_howManyAlreadySpawned = 0;

	//_nearBuildings = (position player) nearObjects ["House", dz_sv_zombies_maxRadius - 50];
	_nearBuildings = nearestObjects [player, ["House"], dz_sv_zombies_maxRadius - 50];
	if (count _nearBuildings > 0) then {
		if (({(_x select 0) distance2D (position (_nearBuildings select 0)) < 170} count dz_cl_blackListedPositions) == 0) then {
			{
				_building = _x;
				if ((_building distance (getMarkerPos "dz_airoampoint_0")) > 2000) then {
					if !((_building buildingPos 0) isEqualTo [0,0,0]) then {
						_countZombies = {_x getVariable ["isZombie",false] AND (agent _x) distance player < dz_sv_zombies_maxRadius} count agents;
						if (_countZombies < dz_sv_zombies_inMaxRadiusMaxZombies AND 0 < (dz_sv_zombies_inMaxRadiusMaxZombies - _countZombies - _howManyAlreadySpawned) AND ({_x getVariable ["isZombie",false]} count agents) < dz_sv_zombies_maxCount) then {
							dz_zombieSpawner_DataToSend pushBack [_building,player];
							_howManyAlreadySpawned = _howManyAlreadySpawned + 1;
							uiSleep 0.1;
							dz_cl_blackListedPositions pushBack [(position _building),diag_tickTime];
						};
					};
				};
			} forEach _nearBuildings;
		};
	};

	/*_passTo = objNull;
	if (isNil "HC_OBJ" AND isServer) then {
		_passTo = player
	} else {
		_passTo = HC_OBJ
	};

	if (count dz_zombieSpawner_DataToSend > 0) then {
		[dz_zombieSpawner_DataToSend] remoteExecCall ["dz_fnc_processZombieData",_passTo];
	};*/
	if (count dz_zombieSpawner_DataToSend > 0) then {
		[dz_zombieSpawner_DataToSend] spawn dz_fnc_processZombieData;
	};
};
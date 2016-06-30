scriptName "fn_zombieSpawner";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_zombieSpawner.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_zombieSpawner.sqf"

// Parameters

// Exceptions
if (!isServer) exitWith {};

// Send remote function to headless client
while {true} do {
	waitUntil {!isNil "HC_OBJ"};

	// Determine Headless client
	if (isDedicated) then {
		waitUntil {!isNil "HC_OBJ"};
		waitUntil {!isNull HC_OBJ};
		uisleep 5;
		dz_sv_HC_1 = HC_OBJ;
	} else {
		dz_sv_HC_1 = player;
	};
	publicVariable "dz_sv_HC_1";

	uiSleep 10;

	[] remoteExec ["dzhc_fnc_init",HC_OBJ];
	{dz_fnc_asyncCall = dzhc_fnc_executeQuery} remoteExec ["BIS_FNC_SPAWN",2];

	diag_log "::::PASSING ZOMBIE SPAWNER TO HEADLESS CLIENT::::";
	[[{
		_dataToProcess = param[0,[],[[]]];
		if (count _dataToProcess == 0) exitWith {};

		// Spawn Zombie at location
		{
			_pos = _x;

			_type = dz_sv_zombies_civilian select (floor random ((count dz_sv_zombies_civilian) - 1));

			if (true) then {
				systemChat "Created";
				if (isNil "_type") then {
					_type = dz_sv_zombies_civilian select (floor random ((count dz_sv_zombies_civilian) - 1));
				};
				diag_log format ["Spawning Zombie %1 at %2",_type,_pos];
				_unit = createAgent  [_type, _pos, [], 0, "NONE"];
				_unit setVariable ['isZombie',true,true];
				_unit setAnimSpeedCoef 0.9;
				_unit addEventHandler ["Killed", {
					(_this select 0) setVariable ["timeSinceDeath",serverTime,true];
					removeVest (_this select 0);
					removeBackpack (_this select 0);
				}];
				_unit disableAI "FSM";
				_unit setBehaviour "CARELESS";
			};
		} forEach _dataToProcess;
	}],{
		dz_fnc_processZombieData = (_this select 0);
	}] remoteExec ["BIS_FNC_SPAWN",dz_sv_HC_1];

	waitUntil {isNil "HC_OBJ"};
};
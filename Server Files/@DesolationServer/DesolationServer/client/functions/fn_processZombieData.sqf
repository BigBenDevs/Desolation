scriptName "fn_processZombieData";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_processZombieData.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_processZombieData.sqf"

// Parameters
_dataToProcess = param[0,[],[[]]];

// Exceptions
if (count _dataToProcess == 0) exitWith {};

// Code
{
	_building = (_x select 0);
	_player = (_x select 1);
	_type = dz_sv_zombies_civilian select (floor random ((count dz_sv_zombies_civilian) - 1));

	_positionFound = false;
	_pos = [0,0,0];
	_tries = 1000;
	while {!_positionFound AND _tries > 0} do {
		_baseX = ((getPos _building) select 0) - 50;
		_baseY = ((getPos _building) select 1) - 50;
		_pos = [(_baseX + (random 100)),(_baseY + (random 100)),0];
		if (({(!lineIntersects [(AGLtoASL _pos),(eyePos _x),_x,objNull])} count AllPlayers) == 0 AND ((_player distance _pos) > 10) AND (_pos distance _player < dz_sv_zombies_maxRadius)) then
		{
			_positionFound = true;
		};
		_tries = _tries - 1;
	};

	if (_tries > 0) then {
		//systemChat "Created";
		if (isNil "_type") then {
			_type = dz_sv_zombies_civilian select (floor random ((count dz_sv_zombies_civilian) - 1));
		};
		diag_log format ["Spawning Zombie %1 at %2",_type,_pos];
		_unit = createAgent  [_type, _pos, [], 0, "NONE"];
		_unit setVariable ["zombieOwner",player,true];
		_unit setVariable ['isZombie',true,true];
		_unit setAnimSpeedCoef 0.9;
		_unit addEventHandler ["Killed", {
			(_this select 0) setVariable ["timeSinceDeath",serverTime,true];
			removeVest (_this select 0);
			removeBackpack (_this select 0);
		}];
		_unit disableAI "FSM";
		_unit setBehaviour "CARELESS";

		// Enable zombie item spawn
		//[_unit] spawn dz_fnc_createZombieLoot;
		//test
	};
} forEach _dataToProcess;
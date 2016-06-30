scriptName "fn_requestPlayerData";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_requestPlayerData.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_requestPlayerData.sqf"

// Parameters
_player = param[0,objNull,[objNull]];

// Exceptions
if (isNull _player) exitWith {diag_log "Error in requestPlayerData, couldnt trace back to player object"};

// Code
_query = format["SELECT PositionATL_Dir, Inventory, Alive, Status, TimeSurvived, ZombiesKilled FROM players WHERE ID='%1'",getPlayerUID _player];
_playerData = [_query,2] call dz_fnc_asyncCall;

if(count _playerData == 0) then {
	// Player does not exist in DB, create him
	_query = format["INSERT INTO players(Name, ID) VALUES ('%1','%2')",name _player,getPlayerUID _player];
	[_query,1] call dz_fnc_asyncCall;
	uisleep 1;
	// Load default values from database
	_query = format["SELECT PositionATL_Dir, Inventory, Alive, Status, TimeSurvived, ZombiesKilled FROM players WHERE ID='%1'",getPlayerUID _player];
	_playerData = [_query,2] call dz_fnc_asyncCall;
	// THIS HAS BEEN REPLACED WITH A CUSTOM LINE
	//_playerData = [[[0,0,0],0],[],0,[100,100,0,0],0,0];
	//_process = false;
	//_playerData = ["[^^,^^,^^,^^,^^]","[[],[],[]]","[^^,[^^,^^,^^,^^],[]]","[^^,[^^,^^,^^,^^],[]]","[^ItemMap^,^ItemCompass^,^ItemWatch^,^ItemRadio^,^NVGoggles^]"];
};

{
	if (typeName _x == typeName "") then {
		diag_log _x;
		_playerData set[_forEachIndex,call compile ([false,_x] call dz_fnc_prepareString)];
	};
} forEach _playerData;

diag_log _playerData;

[_playerData] remoteExec ["dz_fnc_receiveData",_player];
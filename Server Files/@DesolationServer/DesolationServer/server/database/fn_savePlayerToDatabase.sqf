scriptName "fn_savePlayerToDatabase";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_savePlayerToDatabase.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_savePlayerToDatabase.sqf"

// Parameters
_playerData = param[0,[],[[]]];
_player = param[1,objNull,[objNUll]];

diag_log format ["Saving player %1 to database",name _player];

// Exceptions
if (count _playerData == 0) exitWith {};
if (isNull _player) exitWith {};

diag_log "1";

_alive = 0;
if (alive _player) then {_alive = 1} else {_alive = 0};

//_GUID = "extDB2" callExtension format ["0:misc:BEGUID:%1",getPlayerUID _player];

// Code
_query = format[
	"UPDATE players SET PositionATL_Dir='%2',Inventory='%3',Alive='%4',Status='%5',TimeSurvived='%6',ZombiesKilled='%7' WHERE ID='%1'",
	getPlayerUID _player,
	str (_playerData select 0),
	([true, str (_playerData select 1)] call dz_fnc_prepareString),
	_alive,
	([true, str (_playerData select 3)] call dz_fnc_prepareString),
	(str (_playerData select 4)),
	(str (_playerData select 5))
];

[_query,1] call dz_fnc_asyncCall;
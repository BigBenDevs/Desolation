/*
	Client spawn request handler
*/
params["_client","_location"];

if !(_client getVariable ["ReadyToSpawn",false]) exitWith {};

_unit = (createGroup CIVILIAN) createUnit [typeof _client, _location, [],0, "NONE"];
_unit allowDamage false;
_unit hideObjectGlobal true;
[_unit] call DS_fnc_setupLoadout;
_unit hideObjectGlobal false;
_unit allowDamage true;
[_unit] remoteExecCall ["DS_fnc_finishSpawn",_client];
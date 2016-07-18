/*
	request spawn database callback (handles response from the database query)

*/

params["_type","_params"];

_playerObj = _params select 0;
_playerUID = getplayeruid _playerObj;

switch(_type) do {
	case "load": {
		["loadMyPlayerStats",_playerUID, "DS_fnc_dbLoadPlayerResponse",[_playerObj]] call DS_fnc_dbRequest; //--- request the players saved data
	};
	case "fresh": {
		[] remoteExec ["DS_fnc_freshSpawn",_playerObj]; //--- tell client to start the fresh spawn sequence
	};
};
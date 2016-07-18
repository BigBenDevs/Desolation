/*
	

*/

//--- player is requesting to spawn in, determine how they should do it
_playerObj = _this select 0;//type of for handler
_playerUID = getPlayerUID _playerObj;



["joinedPlayerCheck",_playerUID, "DS_fnc_dbOnSpawnResponse",[_playerObj]] call DS_fnc_dbRequest; //--- send request to database
/*
	Desolation Plugin Client Init
	By Kegan
*/

0 cutText ["Waiting for server...","BLACK FADED",2];
0 fadeSound 0;
0 fadeMusic 0;

//asks the server to spawn us
[player] remoteExec ["DS_fnc_requestSpawn", 2];





/*
DesolationPlayerID = player;
if!(DesolationPlayerID isEqualTo "") then 
{
	_data = ["joinedPlayerCheck",DesolationPlayerID, player] remoteExecCall ["playerStatsHandler", 2];
};
if!(_data isEqualTo "")then
{
	endMission "You do not have any data to load, something went really wrong";
};
//get variable for new spawn or loaded saved data.

//--- Todo check if player is saved in DB and load their last save if not dead
call DS_fnc_freshSpawn;
*/
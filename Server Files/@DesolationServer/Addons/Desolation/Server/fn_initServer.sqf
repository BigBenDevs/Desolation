/*
	Server initialization
*/

_debug = call compile (["DebugMode","DS"] call BASE_fnc_getCfgValue);

[1000] spawn DS_fnc_spawnVehicles; //--- spawn 1000 vehicles (TODO: take into account database vehicles & the cfg entry for vehicle spawn count)

if !(_debug) then {
	{
		_x setMarkerAlpha 0;
	} forEach allMapMarkers;
};

//DB initialization
_connectionStarted = false;
_dbVersion = parseNumber ("extDB2" callExtension "9:VERSION"); // use version 69 as of 7/16/2016 - v71 available?
DESOLATIONSERVERRANDOMID = str(round(random(999999)));
DESOLATIONSERVERRANDOMID = DESOLATIONSERVERRANDOMID;
diag_log format["[DesolationDebug]Database random ID:%1",DESOLATIONSERVERRANDOMID];//log db created
if(_dbVersion >= 69) then 
{
	_lockedDBcheck =("extDB2" callExtension "9:LOCK_STATUS"); // response is 1 for locked 0 for unlocked
	_parseLockCheck = parseNumber(_lockedDBcheck);
	//_lockCheckResult=format["%1",_parseLockCheck];
	diag_log format["[DesolationDebug]Database locked check:%1",_parseLockCheck];//log db created
	if(_parseLockCheck isEqualTo 0) then 
	{
		_addDB = call compile ("extDB2" callExtension "9:ADD_DATABASE:desolation");
		if (_addDB select 0 isEqualTo 0) then
		{
			diag_log format ["[DesolationDebug]Could not add database: %1", _addDB]; 
		};
		_dbCreate = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:desolation:SQL_CUSTOM_V2:%1:desolation", DESOLATIONSERVERRANDOMID]);
		diag_log format["[DesolationDebug]Database created %1",_dbCreate];//log db created
		_dbWasCreated = _dbCreate select 0;
		if!(_dbWasCreated isEqualTo 0) then 
		{
			//Deso Server is starting
			DESOLATIONSERVERSTARTTIME = (call compile ("extDB2" callExtension "9:LOCAL_TIME")) select 1;
			diag_log format["[DesolationDebug]Database started @ %1",DESOLATIONSERVERSTARTTIME];//log db start time
			"extDB2" callExtension "9:LOCK";//lock db in case of loop
			_connectionStarted = true;
			"extDB2" callExtension "9:START_RCON:RCON";//start RCON
		}else{
			endMission format["[DesolationDebug]ServerDatabase creation failed for ServerID:%1",DESOLATIONSERVERRANDOMID];
		};
	}else{
		endMission format["[DesolationDebug]ServerDatabase is locked(could be looping) for ServerID:%1",DESOLATIONSERVERRANDOMID];
	};
}else{
	endMission format["[DesolationDebug]ServerDatabase version is older than required for ServerID:%1",DESOLATIONSERVERRANDOMID];
};	
//load any other things from here :)


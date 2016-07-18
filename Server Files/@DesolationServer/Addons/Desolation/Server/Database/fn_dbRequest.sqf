

params["_type","_identifier",["_callback",""],["_callbackParam",[]]];



_prepOutgoing = format ["%1:%2",_type,_identifier];
_preparedQuery = [0, DESOLATIONSERVERRANDOMID, _prepOutgoing] joinString ":";

diag_log format["[DesolationDebug] PrepQuery:%1 and preparedQ:%2",_prepOutgoing,_preparedQuery];
switch(_type)do{
	case "joinedPlayerCheck":{
		_playerCheck = call compile ("extDB2" callExtension _preparedQuery);
		_inDB = true;//_playerCheck select 0;//receive true or false back
		if(_inDB)then{
			["load",_callbackParam] call (missionNamespace getVariable [_callback,{diag_log "<REQUEST ERROR>: callback not defined?";}]); 
			
			// ["loadMyPlayerStats",_playerID, _playerObj] call DS_fnc_playerStatsHandler;
		}else{
			["fresh", _callbackParam] call (missionNamespace getVariable [_callback,{diag_log "<REQUEST ERROR>: callback not defined?";}]); 
		};
	};
	case "loadMyPlayerStats":{
		_loadPlayer = call compile ("extDB2" callExtension _preparedQuery);
		_loadPlayer = ["765123456789","MusTanG",true,0.90,13124,5625,0]; // TEMP
		[_loadPlayer,_callbackParam] call (missionNamespace getVariable [_callback,{diag_log "<REQUEST ERROR>: callback not defined?";}]); //["ds_fnc_receivePlayerData",_player];
		//get data, create player, place them in their spot
		//send this info to the client for processing
	};
	//not sure about this next one, doesnt fit the bill with the incoming params
	case "updateMyPlayer":{
		_updateMyPlayer = call compile ("extDB2" callExtension _preparedQuery);
		//update incoming stats to player DB
		//do nothing back to client or send a yes to verify stats updated?
	};
};

//--- Not joining in progress? Kick client to lobby, no idea wat the fuck is happening
if(!(_this select 1)) then {
	diag_log "JIP NOT ALLOWED. WHY DID THIS HAPPEN?";
	endMission "FAIL";
};
10000 cutText ["Please wait...","BLACK FADED",0];
enableSaving[false,false];
player allowDamage false;

call BASE_fnc_init;

onPreloadFinished {
	disableUserInput true;
	player setVariable["isReady",true,true];
	BASE_var_LastData = diag_tickTime;
	[] spawn BASE_fnc_TimeoutCheck;
	onPreloadFinished {};
};
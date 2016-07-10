while{BASE_var_LastData != 0} do {
	if((BASE_var_LastData + 60) < diag_tickTime && BASE_var_LastData != 0) then {
		diag_log "TIMEOUT ON JOIN";
		endMission "FAIL";
	};
	uiSleep 1;
};
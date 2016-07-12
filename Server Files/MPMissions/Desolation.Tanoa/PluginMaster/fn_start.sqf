disableUserInput false;
{
	if((toLower(_x) find "initclient") != -1) then {
		[] spawn (missionNamespace getVariable [_x,{DIAG_LOG "FAILED TO FIND FUNCTION";}]);
	};
} forEach BASE_var_Files;
10000 cutText ["","BLACK IN",1];

private["_code"];
params["_fnclist"];

diag_log "<PluginManager>: Initializing server events";

{
	if((toLower(_x) find "handledisconnect") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		
	};
	if((toLower(_x) find "oneachframe") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		
	};
	
} forEach _fnclist;
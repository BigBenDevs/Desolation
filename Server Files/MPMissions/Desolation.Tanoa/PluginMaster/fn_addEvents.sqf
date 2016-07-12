private["_code"];

{
	if((toLower(_x) find "keydown") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		
	};
	if((toLower(_x) find "oneachframe") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		
	};
	if((toLower(_x) find "fired") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		
	};
	if((toLower(_x) find "handledamage") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		
	};
	
} forEach BASE_var_Files;
/*
	initializes the eventhandlers broadcasted from plugins
*/
private["_code","_addToEventStack"];

_addToEventStack = {
	params["_type","_code"];
	
	_var = "BASE_var_" + _type;
	if(isNil _var) then {missionNamespace setVariable [_var,[]];};
	
	_value = missionNamespace getVariable _var;
	_value pushback [_code,str(floor(random(1000000)))];
	missionNamespace setVariable [_var,_value];
};


{
	if((toLower(_x) find "keydown") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		["KEYDOWN", _code] call _addToEventStack;
	};
	if((toLower(_x) find "oneachframe") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		[((_x select 0) + (_x select 1)) + "oef", "onEachFrame", _code] call BIS_fnc_addStackedEventHandler;
	};
	if((toLower(_x) find "onmapsingleclick") != -1) then {
		_code = missionNamespace getVariable [_x,{}];
		
		[((_x select 0) + (_x select 1)) + "oef", "onMapSingleClick", _code] call BIS_fnc_addStackedEventHandler;
	};
	
} forEach BASE_var_Files;
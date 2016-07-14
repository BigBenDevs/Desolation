/*
	initializes UI event handlers
*/

(findDisplay 46) displayAddEventHandler ["KeyDown",{
	_key = _this select 1;
	
	_value = false;
	{
		_code = _x select 0;
		
		_response = [_key] call _code;
		if(!isNil {_response}) then {
			if(typename _response == typename true) then {
				_value = _value || _response;
			};
		};
	} forEach (missionNamespace getVariable ["BASE_var_KEYDOWN",[]]);
	_value;
}];
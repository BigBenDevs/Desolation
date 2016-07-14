/*
	adds an event handler to the base stack
*/
params["_type","_code"];

_value = missionNamespace getVariable ["BASE_var_" + _type,[]];
_key = str(floor(random(1000000)));

_value pushBack [_code,_key];
missionNamespace setVariable ["BASE_var_" + _type,_value];

_key;
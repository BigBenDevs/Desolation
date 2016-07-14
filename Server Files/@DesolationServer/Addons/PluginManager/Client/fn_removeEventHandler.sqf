/*

*/
params["_type","_key"];

_value = missionNamespace getVariable ["BASE_var_" + _type,[]];


_found = false;
_rIndex = -1;
{
	_k = _x select 1;
	if(_key == _k) exitWith {
		_found = true;
		_rIndex = -1;
	};
} forEach _value;

_code = {};
if(_found) then {
	_code = (_value deleteAt _rIndex) select 0;
	missionNamespace setVariable ["BASE_var_" + _type,_value];
};

_code;
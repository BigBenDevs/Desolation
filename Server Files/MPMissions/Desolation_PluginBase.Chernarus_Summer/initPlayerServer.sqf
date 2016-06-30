
_this spawn {
	_unit = _this select 0;
	_jip = _this select 1;

	waitUntil{_unit getVariable ["isReady",false]}; // wait for client to be ready
	waitUntil{!isNil "BASE_var_FUNCTIONLIST"}; // wait for server to be ready 
	[BASE_var_FUNCTIONLIST] remoteExecCall ["BASE_fnc_ReceiveProgressData",_unit]; // start loadin process

};

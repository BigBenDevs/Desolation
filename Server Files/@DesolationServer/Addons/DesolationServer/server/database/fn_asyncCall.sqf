scriptName "fn_asyncCall";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_asyncCall.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_asyncCall.sqf"

private["_tickTime","_queryStmt","_queryResult","_key","_mode","_return","_loop","_multiarr","_keyMode"];

_tickTime = diag_tickTime;

_queryStmt = param [0,"",[""]];
_mode = param [1,1,[0]];
_multiarr = param [2,false,[false]];

diag_log "===== DATABASE =====";
diag_log format ["DSL-DB: %1",_queryStmt];
diag_log "DSL-DB: Awaiting result...";

_mateICouldntBeBotheredToGiveThisVariableAProperName = false;
if (_mode == 1 AND !isNil "HC_OBJ") then {
	if ((HC_OBJ getVariable ["ready",false])) then {
		[_queryStmt,_mode,_multiarr] remoteExec ["dzhc_fnc_executeQuery",HC_OBJ];
		diag_log "DSL-DB: Successful, query send to headless client, no return";
		diag_log "====================";
		_mateICouldntBeBotheredToGiveThisVariableAProperName = true;
	};
};
if (_mateICouldntBeBotheredToGiveThisVariableAProperName) exitWith {true};

_result = "extDB2" callExtension format["%1:%2:%3",_mode, DZ_DB_ID, _queryStmt];

if(_mode == 1) exitWith {
	diag_log "DSL-DB: Successful, no return";
	diag_log "====================";
	true;
};

_result = call compile format["%1",_result];
_key = (_result select 1);
_keyMode = (_result select 0);

uisleep (random .03);

// Get Result via 4:x (single message return)  v19 and later
_queryResult = "";
_loop = true;

while{_loop} do
{
	_queryResult = "extDB2" callExtension format["4:%1", _key];
	switch(_queryResult) do {

		case "[5]": {
			// extDB2 returned that result is Multi-Part Message
			_queryResult = "";
			while{true} do {
				_pipe = "extDB2" callExtension format["5:%1", _key];
				if(_pipe == "") exitWith {_loop = false};
				_queryResult = _queryResult + _pipe;
			};
		};

		case "[3]": {
			uisleep 0.3;
		};

		default {
			_loop = false;
		};
	};
};

_queryResult = call compile _queryResult;

// Not needed, its SQF Code incase extDB ever returns error message i.e Database Died
if ((_queryResult select 0) == 0) exitWith {
	[];
};

_return = (_queryResult select 1);

if(!_multiarr && count _return > 0) then {
	_return = _return select 0;
};

diag_log "DSL-DB: Successful";
diag_log format ["DSL-DB: %1",_return];
diag_log "====================";

_return;
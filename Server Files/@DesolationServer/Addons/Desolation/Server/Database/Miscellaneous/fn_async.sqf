/*
	File: asyncCall.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Commits an asynchronous call to extDB
	Gets result via extDB  4:x + uses 5:x if message is Multi-Part

	Parameters:
		0: STRING (Query to be ran).
		1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
*/

private["_queryStmt","_queryResult","_key","_mode","_return","_loop"];

if (!params [
	["_queryStmt", "", [""]],
	["_mode", 0, [0]]
]) exitWith {};

_key = "extDB2" callExtension format["%1:%2:%3",_mode, (call extDB_SQL_CUSTOM_ID), _queryStmt];
if(_mode isEqualTo 1) exitWith {true};

_key = call compile format["%1",_key];
_key = _key select 1;

uisleep (random .03);

_queryResult = "";
_loop = true;
while{_loop} do
{
	_queryResult = "extDB2" callExtension format["4:%1", _key];
	if (_queryResult isEqualTo "[5]") then {
		// extDB2 returned that result is Multi-Part Message
		_queryResult = "";
		while{true} do {
			_pipe = "extDB2" callExtension format["5:%1", _key];
			if(_pipe isEqualTo "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	}
	else
	{
		if (_queryResult isEqualTo "[3]") then
		{
			diag_log format ["extDB2: uisleep [4]: %1", diag_tickTime];
			uisleep 0.1;
		} else {
			_loop = false;
		};
	};
};


_queryResult = call compile _queryResult;

// Not needed, its SQF Code incase extDB2 ever returns error message i.e Database Connection Died
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []};
_return = (_queryResult select 1);
_return;

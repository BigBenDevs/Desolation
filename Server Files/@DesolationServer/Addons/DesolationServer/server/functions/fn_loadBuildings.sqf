scriptName "fn_loadBuildings";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_loadBuildings.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadBuildings.sqf"

// Parameters


// Exceptions


// Code
_highestid = 0;

_query = format["SELECT ID FROM buildings ORDER BY ID DESC LIMIT 1"];
_highestID = ([_query,2] call dz_fnc_asyncCall) select 0;

if (isNil "_highestid") then {
	_highestid = -1;
};

for "_i" from 0 to _highestID step 1 do
{
	_query = format["SELECT * FROM buildings WHERE ID='%1'",_i];

	_tentData = [_query,2] call dz_fnc_asyncCall;
	if (count _tentData > 0) then {
		diag_log str _tentData;
		{
			_tentData set [_forEachIndex,if(typeName _x == typeName "" AND !(_forEachIndex in [0,1])) then {call compile ([false,_x] call dz_fnc_prepareString)} else {_x}];
		} forEach _tentData;

		_ID = _tentData select 0;
		_type = _tentData select 1;
		_inv = _tentData select 2;
		_pos = (_tentData select 3) select 0;
		_dir = (_tentData select 3) select 1;

		[_ID,_pos,_dir,_inv,false,_type] call dz_fnc_initializeTent;

		diag_log format ["LOAD BUILDING %1 AT %2",_ID,_pos];
	};
};
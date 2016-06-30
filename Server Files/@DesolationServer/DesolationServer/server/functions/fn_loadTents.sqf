scriptName "fn_loadTents";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_loadTents.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadTents.sqf"

// Parameters


// Exceptions


// Code

// OLD METHOD
/*_query = format["SELECT * FROM tents"];
_tentsData = [_query,2,true] call dz_fnc_asyncCall;

{
	_tentData = _x;
	{
		_tentData set [_forEachIndex,if(typeName _x == typeName "" AND !(_forEachIndex in [0,1])) then {call compile ([false,_x] call dz_fnc_prepareString)} else {_x}];
	} forEach _tentData;

	_ID = _tentData select 0;
	_type = _tentData select 1;
	_inv = _tentData select 2;
	_pos = (_tentData select 3) select 0;
	_dir = (_tentData select 3) select 1;

	[_ID,_pos,_dir,_inv,false,_type] call dz_fnc_initializeTent;
} forEach _tentsData;*/

// NEW METHOD

// Get highest index
/*_highestid = 0;

_query = format["SELECT ID FROM tents ORDER BY ID DESC LIMIT 1"];
_highestID = ([_query,2] call dz_fnc_asyncCall) select 0;

if (isNil "_highestid") then {
	_highestid = -1;
};*/

/*for "_i" from 0 to _highestID step 1 do
{
	_query = format["SELECT * FROM tents WHERE ID='%1'",_i];

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

		diag_log format ["LOAD TENT %1 AT %2",_ID,_pos];
	};
};*/


_count = (["SELECT COUNT(*) FROM tents",2] call dz_fnc_asyncCall) select 0;
diag_log format ["-----1: %1", _count];

for [{_x=0},{_x<=_count},{_x=_x+5}] do {
	diag_log format ["-----2: %1", _x];
	_query = format["SELECT * FROM tents LIMIT %1,5",_x];
	diag_log format ["-----3: %1", _query];
	_TentID = _x;
	_tentsData = [_query,2,true] call dz_fnc_asyncCall;
	diag_log format ["-----4: %1", _tentsData];

	diag_log format ["Loading Tent %1 (%2)",_TentID,_tentsData];
	if (count _tentsData == 0) exitWith {};
	{
		diag_log format ["-----5: %1", _x];
		_tentData = _x;
		if (count _tentData > 0) then {
			{
				_tentData set [_forEachIndex,if(typeName _x == typeName "" AND !(_forEachIndex in [0,1])) then {call compile ([false,_x] call dz_fnc_prepareString)} else {_x}];
			} forEach _tentData;

			_ID = _tentData select 0;
			_type = _tentData select 1;
			_inv = _tentData select 2;
			_pos = (_tentData select 3) select 0;
			_dir = (_tentData select 3) select 1;

			[_ID,_pos,_dir,_inv,false,_type] call dz_fnc_initializeTent;

			diag_log format ["LOAD TENT %1 AT %2",_ID,_pos];
		};
	} foreach _tentsData;
};
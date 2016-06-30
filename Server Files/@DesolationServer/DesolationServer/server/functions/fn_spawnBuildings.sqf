scriptName "fn_spawnBuildings";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_spawnBuildings.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_spawnBuildings.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code

// Get highest index
_highestid = 0;

_query = format["SELECT ID FROM buildings ORDER BY ID DESC LIMIT 1"];
_highestID = ([_query,2] call dz_fnc_asyncCall) select 0;

if (isNil "_highestid") then {
	_highestid = -1;
};

for "_i" from 0 to _highestID step 1 do
{
	_query = format["SELECT * FROM buildings WHERE ID='%1'",_i];

	_buildingData = [_query,2] call dz_fnc_asyncCall;
	if (count _buildingData > 0) then {
		diag_log str _buildingData;
		{
			_buildingData set [_forEachIndex,if(typeName _x == typeName "" AND !(_forEachIndex in [0,1])) then {call compile ([false,_x] call dz_fnc_prepareString)} else {_x}];
		} forEach _buildingData;

		_ID = _buildingData select 0;
		_type = _buildingData select 1;
		_inv = _buildingData select 2;
		_pos = (_buildingData select 3) select 0;
		_dir = (_buildingData select 3) select 1;
		_level = _buildingData select 4;
		_whitelistedUIDs = _buildingData select 5;

		//[_ID,_pos,_dir,_inv,false,_type] call dz_fnc_initializeBuilding;
		[_ID,_type,_pos,_dir,_inv,false,_level,_whitelistedUIDs] spawn dz_fnc_initializeBuilding;

		diag_log format ["LOAD BUILDING %1 AT %2",_ID,_pos];
	};
};
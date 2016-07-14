scriptName "fn_getBuildingPos";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_getBuildingPos.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_getBuildingPos.sqf"

// Parameters
_building = param[0,objNull,[objNull]];

// Exceptions
if (isNUll _building) exitWith {};

// Code
_i = 0;
_positions = [];

while {_i > (-1)} do
{
	if ((_building buildingPos _i) isEqualTo [0,0,0]) then {_i = -1;} else {
		_positions pushBack (_building buildingPos _i);
		_i = _i + 1;
	};
};

{
	if ((_x select 1) == (typeOf _building)) then {
		_positions = [];
		{
			_positions pushBack (_building modelToWorld _x);
		} forEach (_x select 2)
	};
} forEach dz_sv_customLootSpots;

_positions
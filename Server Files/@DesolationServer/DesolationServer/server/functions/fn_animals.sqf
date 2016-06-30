scriptName "fn_animals";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_animals.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_animals.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code

_radius = 200;
_types = dz_sv_animalTypes;
_maxCount = 40;

dz_sv_animals = [];
while {true} do {
	{
		if (isNull _x) then {
			dz_sv_animals deleteAt _forEachIndex;
		};
	} forEach dz_sv_animals;
	_positions = [];
	{
		_player = _x;
		if ({_player distance _x < 200} count dz_sv_animals < 2) then {
			if ((random 1) < 0.06) then {_positions pushBack (getPos _x);};
			//test
		};
	} forEach AllPlayers;
	// Spawn animals
	while {({alive _x} count dz_sv_animals) < _maxCount AND (count _positions > 0)} do {
		_whereToSpawn = _positions select 0;
		_positions deleteAt 0;
		_pos = [((_whereToSpawn select 0) - _radius) + (random _radius),((_whereToSpawn select 1) - _radius) + (random _radius),0];
		//(_types call BIS_FNC_selectRandom) createUnit [_pos, createGroup EAST, "dz_sv_animals pushBack _this;diag_log str _this"];
		_unit = createAgent [(_types call BIS_FNC_selectRandom), _pos, [], 5, "CAN_COLLIDE"];
		_unit setVariable ["isAnimal",true,true];
		_unit addEventHandler ["Killed",{
			(_this select 0) setVariable ["timeSinceDeath",serverTime,true];
		}];
		dz_sv_animals pushBack _unit;
		diag_log format["Animal unit at %1",getPos (dz_sv_animals select (count dz_sv_animals - 1))];
	};

	uisleep 360;
};
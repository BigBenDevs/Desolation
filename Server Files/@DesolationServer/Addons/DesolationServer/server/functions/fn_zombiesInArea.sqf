scriptName "fn_zombiesInArea";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_zombiesInArea.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_zombiesInArea.sqf"

// Parameters
_position = param[0,[0,0,0],[[]]];
_radius = param[1,0,[0]];

// Exceptions
if (_position isEqualTo [0,0,0]) exitWith {};

// Code
_units = _position nearObjects ["Man", _radius];

{_x getVariable ["isZombie",false]} count _units;
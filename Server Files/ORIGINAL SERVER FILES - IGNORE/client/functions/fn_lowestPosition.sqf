scriptName "fn_lowestPosition";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_lowestPosition.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_lowestPosition.sqf"

// Parameters
_pos = param[0,[0,0,0],[[]]];
_pos = AGLToASL _pos;

// Exceptions
if (_pos isEqualTo [0,0,0]) exitWith {[0,0,0]};

// Code
_intersectsAt = lineIntersectsSurfaces [_pos, _pos vectorAdd [0, 0, -50], player, objNull, true, 1, "GEOM", "NONE"];

if (count _intersectsAt > 0) then {
	ASLToAGL (((_intersectsAt select 0) select 0))
} else {
	[0,0,0]
};
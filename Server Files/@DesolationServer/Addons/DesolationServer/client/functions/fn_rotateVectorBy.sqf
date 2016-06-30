if (isDedicated) exitWith {};scriptName "fn_rotateVectorBy";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_rotateVectorBy.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_rotateVectorBy.sqf"

// BROKEN


// Parameters
_v = param[0,[],[[]]];
_d = param[1,0,[0]];
_c = param[2,sqrt 2,[0]];

// Exceptions
if (_v isEqualTo []) exitWith {[]};

// Code
_px = _v select 0;
_py = _v select 1;

systemChat str _px;
systemChat str _py;

_nx = 0;
_ny = 0;

if ((_px < 0) OR (_py < 0)) then {
	_nx = sin ((asin (_px/_c)) + _d + 180) * _c;
	_ny = cos ((asin (_px/_c)) + _d + 180) * _c;
} else {
	_nx = sin ((asin (_px/_c)) + _d) * _c;
	_ny = cos ((asin (_px/_c)) + _d) * _c;
};

// Return
[round (_nx * (10 ^ 2)) / (10 ^ 2),round (_ny * (10 ^ 2)) / (10 ^ 2),_v select 2]
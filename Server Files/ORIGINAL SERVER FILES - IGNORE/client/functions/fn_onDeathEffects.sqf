scriptName "fn_onDeathEffects";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_onDeathEffects.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_onDeathEffects.sqf"

// Parameters
_body = param[0,objNull,[objNull]];

// Exceptions
if (isNull _body) exitWith {};

// Code
uiSleep 30;
_flies = [position _body, 0.05, 1.5] call BIS_fnc_flies;
uiSleep 300;
{
	deleteVehicle _x;
} forEach _flies;
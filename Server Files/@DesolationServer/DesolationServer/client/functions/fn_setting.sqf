scriptName "fn_setting";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_setting.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_setting.sqf"

// Parameters
_setting 	= param[0,"",[""]];
_value		= param[1,nil];

// Exceptions
if (_setting == "") exitWith {};

// Code
if (isNil "_value") then {
	profileNamespace getVariable format ["dz_setting_%1",_setting];
} else {
	profileNamespace setVariable [format ["dz_setting_%1",_setting],_value];
	saveProfileNamespace;
};
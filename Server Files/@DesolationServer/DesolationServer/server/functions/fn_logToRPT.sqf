scriptName "fn_logToRPT";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_logToRPT.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_logToRPT.sqf"

// Parameters
_toLog = param[0,"",[""]];

// Exceptions
if (_toLog == "") exitWith {};

// Code
diag_log format ["%1: %2",dz_sv_logPrefix,_toLog];
if (isDedicated) exitWith {};scriptName "fn_log";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_log.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_log.sqf"

_toLog = param[0,"",[""]];

// Exceptions
if (count _toLog < 1) exitWith {};

// Log to RPT
diag_log format ["*** DAYZ LOG *** : %1 : %2",diag_tickTime,_toLog];

// Return true if the file was called
true
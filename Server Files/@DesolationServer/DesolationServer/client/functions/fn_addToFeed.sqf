if (isDedicated) exitWith {};scriptName "fn_addToFeed";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_addToFeed.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_addToFeed.sqf"

// Parameters
_toAdd = param[0,"",[""]];

// Exceptions
if (_toAdd == "") exitWith {};

_toAdd = ("<t font='Roboto'>" + _toAdd + "</t>");

// Code
dz_statusFeed pushBack _toAdd;

[] spawn {
	uisleep 10;
	dz_statusFeed deleteAt 0;
};
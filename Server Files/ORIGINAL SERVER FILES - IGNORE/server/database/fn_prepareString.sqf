scriptName "fn_prepareString";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_prepareString.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_prepareString.sqf"

// Parameters
_toDatabase = param[0,false,[false]];
_string		= param[1,"",[""]];

// Exceptions
if (_string == "") then {""};

// Code
_stringArray = [];

if (_toDatabase) then {
	_stringArray = toArray _string;
	{
		if (_x == 34) then {
			_stringArray set[_forEachIndex,94];
		};
	} forEach _stringArray;

} else {
	_stringArray = toArray _string;
	{
		if (_x == 94) then {
			_stringArray set[_forEachIndex,34];
		};
	} forEach _stringArray;
};

(toString _stringArray)
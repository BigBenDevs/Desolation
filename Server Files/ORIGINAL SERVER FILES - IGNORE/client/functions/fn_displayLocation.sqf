if (isDedicated) exitWith {};scriptName "fn_displayLocation";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_displayLocation.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_displayLocation.sqf"

// Parameters


// Exceptions


// Code
_locationTypes =
[
	"NameCity",
	"NameCityCapital",
	"NameMarine",
	"NameVillage",
	"NameLocal",
	"Hill",
	"Mount"
];

_locations = nearestLocations [position player, _locationTypes, 3000];
_location = _locations select 0;


_text = "";
if (isNil "_location") then {
	_text = "";
} else {
	_text = text _location;
};

["CHERNARUS" , "23.08.2024", _text] spawn BIS_fnc_infoText;
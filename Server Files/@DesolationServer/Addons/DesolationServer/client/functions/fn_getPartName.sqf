if (isDedicated) exitWith {};scriptName "fn_getPartName";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_getPartName.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_getPartName.sqf"

// Parameters
_part = param[0,"",[""]];

// Exceptions
if (_part == "") exitWith {""};

// Code
_ret = switch (_part) do {
	case "HitLFWheel": {"Left Front Wheel"};
	case "HitLF2Wheel": {"Left Back Wheel"};
	case "HitRFWheel": {"Right Front Wheel"};
	case "HitRF2Wheel": {"Right Back Wheel"};
	case "HitFuel": {"Fuel Tank"};
	case "HitEngine": {"Engine Block"};
	case "HitBody": {"Vehicle Hull"};
	case "HitLMWheel": {"Left Center Wheel"};
	case "HitRMWheel": {"Right Center Wheel"};
	case "HitAvionics": {"Instruments"};
	case "HitHRotor": {"Main Rotor"};
	case "HitVRotor": {"Tail Rotor"};
	case "HitHull": {"Hull"};
};

_ret
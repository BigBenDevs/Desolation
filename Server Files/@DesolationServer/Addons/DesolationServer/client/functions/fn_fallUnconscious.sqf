if (isDedicated) exitWith {};scriptName "fn_fallUnconscious";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_fallUnconscious.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_fallUnconscious.sqf"

// Parameters

// Exceptions
if !(isNil {player getVariable "uncon"}) exitWith {};

// Code
player setVariable ["uncon",true,true];
_randomTime = random 30;
dz_inAction = true;

// Make the screen blurry
0 = ["DynamicBlur", 400, [6]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		dz_playerMenuBlur = ppEffectCreate [_name, _priority];
		dz_playerMenuBlur < 0
	} do {
		_priority = _priority + 1;
	};
	dz_playerMenuBlur ppEffectEnable true;
	dz_playerMenuBlur ppEffectAdjust _effect;
	dz_playerMenuBlur ppEffectCommit 0.1;
};

// Disable User Input
disableUserInput true;

// sleep
uisleep _randomTime;

// Enable actions again
dz_inAction = false;

// Delete blurry effect
0 = ["DynamicBlur", 400, [0]] spawn {
	params ["_name", "_priority", "_effect", "_handle"];
	while {
		dz_playerMenuBlur = ppEffectCreate [_name, _priority];
		dz_playerMenuBlur < 0
	} do {
		_priority = _priority + 1;
	};
	dz_playerMenuBlur ppEffectEnable true;
	dz_playerMenuBlur ppEffectAdjust _effect;
	dz_playerMenuBlur ppEffectCommit 10;
};
disableUserInput false;
player setVariable ["uncon",nil,true];
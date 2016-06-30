if (isDedicated) exitWith {};scriptName "fn_hitEffect";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_hitEffect.sqf

	<DAY ZERO>
    Written by OPTiX & Hungry
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_hitEffect.sqf"

// Parameters
_infectOption = param[0,true,[true]];

// Exceptions


// Code
_damage = damage player;
dz_grayScreenEffect ppEffectEnable true;dz_grayScreenEffect ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.1],  [1, 1, 1, 0.0]];dz_grayScreenEffect ppEffectCommit 0;
"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [2]; "dynamicBlur" ppEffectCommit 0;
addCamShake [5, 0.5, 25];
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];"colorCorrections" ppEffectCommit 0.6;
"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 0.6;
uisleep 0.2;
dz_grayScreenEffect ppEffectEnable true;
dz_grayScreenEffect ppEffectAdjust
[
	1,
	1 - ((damage player)*0.6),
	0,
	0, 0, 0, 0,
	1, 1, 1, 1 - ((_damage)*1),
	0.299 + ((_damage)*(0.701)), 0.587 + ((_damage)*(0.413)), 0.114 + ((_damage)*(0.886)), 0
];
dz_grayScreenEffect ppEffectCommit 0.3;

// Random change to get infected
if (_infectOption) then {
	[0.1] spawn dz_fnc_infectMe;
};
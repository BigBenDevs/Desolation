if (isDedicated) exitWith {};scriptName "fn_zombieHitCheck";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_zombieHitCheck.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_zombieHitCheck.sqf"

// Parameters
_zombie = param[0,objNull,[objNull]];

// Exceptions
if (isNull _zombie) exitWith {};
if ((_zombie distance player) > (Ryanzombiesattackdistance + 0.1)) exitWith {};
if (lineIntersects [(eyePos _zombie),(eyePos player),player,_zombie]) exitWith {};

// Code
if (!(player getVariable ["bleeding",false]) AND ((floor random 100) < 10)) then {
	player setVariable ["bleeding",true,true];
	addCamShake [4, 9999, 0.5];
	["<t color='#D90C01'>I am bleeding</t>"] spawn dz_fnc_addToFeed;
};

_zombie setdir ([_zombie, player] call BIS_fnc_dirTo);
player setdamage (damage player + Ryanzombiesdamage);
[] spawn dz_fnc_hitEffect;
if (!(player getVariable ["brokenlegs",false]) AND ((random 100) < 0.3)) then {
	[] spawn dz_fnc_breakLegs;
};
scriptName "fn_dayNightCycle";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_dayNightCycle.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_dayNightCycle.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};
dz_sv_zombies_civilian = [];

// Code
_tick = -99999;
while {dz_sv_fastDayNightCycle} do {
	if (diag_tickTime - _tick >= 20) then {
		_tick = diag_tickTime;
		if (daytime > 6 AND daytime < 19.5) then {
			setTimeMultiplier dz_sv_dayNightCycleMulti_Day;
			if !(dz_sv_zombies_civilian isEqualTo dz_sv_zombies_civilian_day) then {
				dz_sv_zombies_civilian = dz_sv_zombies_civilian_day;
				dz_sv_zombies_damage = dz_sv_zombies_damageDay / 10000;
				publicVariable "dz_sv_zombies_civilian";
				publicVariable "dz_sv_zombies_damage";
				Ryanzombiesdamage = dz_sv_zombies_damage;
				publicVariable "Ryanzombiesdamage";
			};
		} else {
			setTimeMultiplier dz_sv_dayNightCycleMulti_Night;
			if !(dz_sv_zombies_civilian isEqualTo dz_sv_zombies_civilian_night) then {
				dz_sv_zombies_civilian = dz_sv_zombies_civilian_night;
				dz_sv_zombies_damage = (dz_sv_zombies_damageDay * 2) / 10000;
				publicVariable "dz_sv_zombies_civilian";
				publicVariable "dz_sv_zombies_damage";
				Ryanzombiesdamage = dz_sv_zombies_damage;
				publicVariable "Ryanzombiesdamage";
			};

			// Random sounds // MOVED TO PLAYER_EVENT_HORROR
			//if ((random 1) < 0.1) then {
			//	_player = AllPlayers call BIS_FNC_SelectRandom;
			//};
		};
	};
};
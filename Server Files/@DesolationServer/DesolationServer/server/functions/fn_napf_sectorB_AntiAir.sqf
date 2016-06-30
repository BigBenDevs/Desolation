scriptName "fn_napf_sectorB_AntiAir";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_napf_sectorB_AntiAir.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_napf_sectorB_AntiAir.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code
dz_sv_sectorB_AA_loop = true;
while {dz_sv_sectorB_AA_loop} do {
	uiSleep 15;
	if (({(getMarkerPos "dz_airoampoint_0") distance _x < 2000} count AllPlayers) > 0) then {
		if (isNil "dz_sv_sectorB_AA") then {
			dz_sv_sectorB_AA = ([[16748.2,18088.3,0.00145721], 128.383, "CUP_B_ZSU23_CDF", EAST] call BIS_fnc_spawnVehicle) select 0;
			createVehicleCrew dz_sv_sectorB_AA;
			dz_sv_sectorB_AA setVehicleLock "LOCKED";
			(driver dz_sv_sectorB_AA) disableAI "MOVE";
		};
	} else {
		if (!isNil "dz_sv_sectorB_AA") then {
			if (!isNull dz_sv_sectorB_AA) then {
				{
					deleteVehicle _x;
				} forEach (crew dz_sv_sectorB_AA);
				deleteVehicle dz_sv_sectorB_AA;
				dz_sv_sectorB_AA = nil;
			};
		};
	};
};
diag_log "done";
scriptName "fn_spawnEvents";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_spawnEvents.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_spawnEvents.sqf"

// Parameters


// Exceptions


// Code
while {true} do {
	uisleep (3000);
    if ((random 1) < 0.3) then {
        [] spawn dz_fnc_createDrop;
    } else {
        if ((random 1) < 0.4) then {
            [] spawn dz_fnc_createCrash;
        } else {
            [] spawn dz_fnc_createHeliCrash;
        };
    };
};
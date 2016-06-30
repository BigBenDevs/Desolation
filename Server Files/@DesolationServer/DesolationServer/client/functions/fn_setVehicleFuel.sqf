scriptName "fn_setVehicleFuel";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_setVehicleFuel.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_setVehicleFuel.sqf"

// Parameters
_veh	= param[0,objNull,[objNull]];
_fuel	= param[1,0,[0]];

// Exceptions
if (isNull _veh) exitWith {};

// Code
_veh setFuel _fuel;
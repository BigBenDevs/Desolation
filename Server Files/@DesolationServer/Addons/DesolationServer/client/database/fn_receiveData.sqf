if (isDedicated) exitWith {};scriptName "fn_receiveData";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_receiveData.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_receiveData.sqf"

// Parameters
_data = param[0,[],[[]]];

// Exceptions
if (count _data < 1) exitwith {};

// Code
dz_PositionATL_Dir = _data select 0;
dz_Inventory = _data select 1;
dz_Alive = _data select 2;
dz_Hunger = (_data select 3) select 0;
dz_Thirst = (_data select 3) select 1;
dz_brokenLegs = if (((_data select 3) select 2) == 1) then {true} else {false};
dz_infected = if (([_data select 3,3,0] call BIS_fnc_param) == 1) then {true} else {false};
dz_TimeSurvived = (_data select 4);
dz_lastTimeCheck = diag_tickTime;
dz_ZombiesKilled = (_data select 5);

dz_playerStatsReceived = true;
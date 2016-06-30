scriptName "fn_clientHouseOutdatedCheck";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_clientHouseOutdatedCheck.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_clientHouseOutdatedCheck.sqf"

// Parameters


// Exceptions
if (isDedicated OR !hasInterface) exitWith {};

// Code
_list = AllMissionObjects "Land_KH_OBJ_small";
_kickMe = false;
{
	_weaponHolder = ((_x getVariable ["dz_house_storage",[objNull]]) select 0);
	if (local _weaponHolder) then {
		deleteVehicle _weaponHolder;
		_x setVariable ["dz_house_storage",nil,true];
		_kickMe = true;
	};
} forEach _list;

if (_kickMe) then {
	endMission "OUTDATEDATA";
};
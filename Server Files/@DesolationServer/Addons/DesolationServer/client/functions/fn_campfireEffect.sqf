if (isDedicated) exitWith {};scriptName "fn_campfireEffect";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_campfireEffect.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_campfireEffect.sqf"

// Parameters
_campfire = param[0,objNull,[ObjNull]];
_create = param[1,false,[false]];

// Exceptions
if (isNull _campfire) exitWith {};

// Code
if (_create) then {
	_ret = [[(getPosATL _campfire) select 0,(getPosATL _campfire) select 1,((getPosATL _campfire) select 2) + 0.2],"FIRE_SMALL"] call BIS_fn_createFireEffect;
	_campfire setVariable ["burning",_ret];
	if (_campfire isKindOf "DayZero_Object_GasCooker") then {
		_campfire addAction ["Turn Off Gas Cooker",{
			[(_this select 0)] spawn dz_fnc_items_extinguishFire;
		},nil,1.5,true,true,"","(player distance _target) < 2"];
	};
} else {
	_effects = _campfire getVariable ["burning",[objNull,objNull,objNull]];
	{
		deleteVehicle _x;
	} forEach _effects;
	removeAllActions _campfire;
	if (_campfire isKindOf "DayZero_Object_GasCooker") then {
		[[_campfire],{
			(_this select 0) addAction ["Pick Up Gas Cooker",{
			deleteVehicle (_this select 0);
			player addItem "DayZero_Item_GasCooker"
			},nil,1.5,true,true,"","(player distance _target) < 2 AND (isNil {_target getVariable 'burning'})"];
		}] remoteExec ["BIS_FNC_SPAWN"];
	};
	_campfire setVariable ["burning",nil];
};
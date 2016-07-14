scriptName "fn_saveVehicle";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_saveVehicle.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_saveVehicle.sqf"

// Parameters
_vehicle = param[0,objNull,[objNull]];

// Exceptions
if (isNull _vehicle) exitWith {};

// Code
_weapons = getWeaponCargo _vehicle;
_magazines = getMagazineCargo _vehicle;
_items = getItemCargo _vehicle;
_backpacks = getBackpackCargo _vehicle;
_position = getPosATL _vehicle;
_direction = getDir _vehicle;

diag_log format ["SAVING VEHICLE TO DATABASE: %1",_vehicle getVariable ["ID",0]];

//diag_log ("HERE " + str [_weapons,_magazines,_items,_backpacks]);

// Get hit points
_damageArray = [];
_hitPoints = [];
{
	if ((_x select 0) == (typeOf _vehicle)) then {
		_hitPoints = (_x select 1);
	};
} forEach dz_sv_vehicleHitPoints;
if (count _hitPoints == 0) then {
	_hitPoints = dz_sv_vehicleHitPointsDefault;
};
for "_i" from 0 to ((count _hitPoints) - 1) step 1 do
{
	if (_hitPoints select _i != "NOENTRY") then {
		_damageArray pushBack (_vehicle getHitPointDamage (_hitPoints select _i));
	};
};

//Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive FROM vehicles WHERE ID='1'
_query = format[
	"UPDATE vehicles SET Type='%1',RealPosition='%2',DamageValues='%3',Inventory='%4',Alive='%5',Fuel='%7' WHERE ID='%6'",
	typeOf _vehicle,
	str([_position,_direction]),
	str _damageArray,
	[true,str [_weapons,_magazines,_items,_backpacks]] call dz_fnc_prepareString,
	if (damage _vehicle == 1) then {0} else {1},
	_vehicle getVariable ["ID",0],
	fuel _vehicle
];

[_query,1] call dz_fnc_asyncCall;
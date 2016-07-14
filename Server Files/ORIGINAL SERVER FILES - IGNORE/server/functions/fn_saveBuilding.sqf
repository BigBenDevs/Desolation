scriptName "fn_saveBuilding";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_saveBuilding.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_saveBuilding.sqf"

// Parameters
_building = param[0,objNull,[objNull]];

// Exceptions
if (isNull _building) exitWith {};

// Code
_ID = _building getVariable ["BuildingID",-1];

diag_log format ["========= DSL SAVE BUILDING ========="];
diag_log format ["DSL-SAVE: Saving %1 to DB",_ID];

_buildingOwner = 2;
_HCOwnerID = -1;
if (!isNil "HC_OBJ") then {
	if (!isNull HC_OBJ AND (HC_OBJ getVariable ["ready",false])) then {
		_HCOwnerID = owner HC_OBJ;
	};
};

if (_ID == -1) exitWith {};

/*if (!isNil {_building getVariable "dz_house_storage"}) then {
	_weaponholder = objNull;
	if (count (_building getVariable "dz_house_storage") > 0) then {
		_weaponholder = ((_building getVariable "dz_house_storage") select 0);
	};

	// Check for ownership of weaponholder
	_WHOwner = owner _weaponholder;

	if !(_WHOwner in [2,_HCOwnerID]) then {

	};

	//deleteVehicle ([_building getVariable "dz_house_storage",0,objNull] call BIS_FNC_param);
	_building setVariable ["dz_house_storage",nil,true];
	diag_log format ["DSL-SAVE: Building with outdated client file detected (ID=%1)",_ID];
	_outdatedClient = true;
};*/

_inventory = [];
{
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;
	_inventory pushBack [_weapons,_magazines,_items,_backpacks];
} forEach (_building getVariable "dz_house_weaponholders");

if (_inventory isEqualto []) exitWith {};

_posAndDir = [getPosATL _building,getDir _building];
_level = _building getVariable ["BuildingLevel",1];
_whitelistedUIDs = str (_building getVariable ["dz_whitelisted_UIDs",[]]);

diag_log format ["DSL-SAVE: %1",_whitelistedUIDs];
diag_log format ["DSL-SAVE: %1",_posAndDir];
diag_log format ["DSL-SAVE: %1",_inventory];
diag_log format ["DSL-SAVE: %1",(_building getVariable "dz_house_weaponholders")];

_query = format[
	"UPDATE buildings SET Type='%1',Inventory='%2',PosAndDir='%3',Level='%5',WhitelistedUIDs='%6' WHERE ID='%4'",
	typeOf _building,
	[true,str _inventory] call dz_fnc_prepareString,
	str _posAndDir,
	_ID,
	_level,
	[true,_whitelistedUIDs] call dz_fnc_prepareString
];
diag_log format ["DSL-SAVE: %1",_query];
[_query,1] call dz_fnc_asyncCall;
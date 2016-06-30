scriptName "fn_initializeBuilding";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_initializeBuilding.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_initializeBuilding.sqf"

// Parameters
_ID = param[0,-1,[0]];
_classname = param[1,"",[""]];
_positionATL = param[2,[0,0,0],[[]]];
_direction = param[3,0,[0]];
_inventory = param[4,[],[[]]];
_creation = param[5,false,[false]];
_level = param[6,1,[0]];
_whitelistedUIDs = param[7,[],[[]]];

_exit = false;
if (!isNil "HC_OBJ" AND isServer) then {
	if (!isNull HC_OBJ AND (HC_OBJ getVariable ["ready",false])) then {
		_exit = true;
		[_ID,_classname,_positionATL,_direction,_inventory,_creation,_level,_whitelistedUIDs] remoteExec ["dz_fnc_initializeBuilding",HC_OBJ];
	};
};
if (_exit) exitWith {diag_log "DSL-SAVE: Saving house pushed to headless client"};

// Exceptions
if (!isServer AND hasInterface) exitWith {};
if (_classname == "") exitWith {};
if (_positionATL isEqualTo [0,0,0]) exitWith {};
if (_ID == -1 AND !_creation) exitWith {};

diag_log format ["======   HOUSE SYS  ======="];
diag_log format ["DSL-SAVE: Trying to load building with ID %1",_ID];

// Get amount of weaponholders
_amountWeaponholders = getNumber(configFile >> "CfgVehicles" >> _classname >> "storageWeaponHolders");

// In case of creation, make a inventory array
_weaponHoldersATM = [];
if (_inventory isEqualTo [] AND _creation) then {
	for "_i" from 1 to _amountWeaponholders step 1 do
	{
		_inventory pushBack [[[],[]],[[],[]],[[],[]],[[],[]]];
	};
};

if (count (nearestObjects [_positionATL, ["DayZero_Object_PersistentWeaponHolder"], 5]) == 0) then {
	for "_i" from 1 to _amountWeaponHolders step 1 do
	{
		//_tmp = createVehicle ["DayZero_Object_PersistentWeaponHolder", _positionATL, [], 0, "CAN_COLLIDE"];
		_tmp = "DayZero_Object_PersistentWeaponHolder" createVehicle _positionATL;
		diag_log format ["DSL-SAVE: Waffenhalter für Haus wurde bei %1 erstellt",_positionATL];
		//_tmp enableSimulation false;
		//_tmp enableSimulationGlobal false;
		_weaponHoldersATM pushBack _tmp;
	};
};

diag_log format ["DSL-SAVE: %1",_weaponHoldersATM];
diag_log format ["DSL-SAVE: %1",_inventory];

// Force building to ground level
_positionATL set [2,0];

// Create the building
_building = createVehicle [_classname, _positionATL, [], 0, "CAN_COLLIDE"];
_building setDir _direction;
_building setPosATL _positionATL;
_surfaceNormal = surfaceNormal (getPosATL _building);
_building setVectorUp _surfaceNormal;
_building setVariable ["BuildingID",_ID,true];
_building setVariable ["BuildingLevel",_level,true];
_building setVariable ["dz_whitelisted_UIDs",_whitelistedUIDs,true];
if (isNil {_building getVariable "dz_house_weaponholders"}) then {
	_building setVariable ["dz_house_weaponholders",_weaponHoldersATM,true];
};

diag_log format ["DSL-SAVE: %1",dz_sv_buildings];

// Get data from config
// _classname = "Land_KH_OBJ_small";_building = cursorObject;
_buildingDataFromConfig = [];
{
	if (_x select 1 == _classname) then {
		_buildingDataFromConfig = _x;
	};
} forEach dz_sv_basebuilding_data;

_index = -1;
{
	_index = _index + 1;
	_posOffset = (_buildingDataFromConfig select 4) select _index;
	_posRelativeToModel = _building selectionPosition _posOffset;
	_posRelativeToWorld = _building modelToWorld _posRelativeToModel;
	_posRelativeToWorld set[2,(_posRelativeToWorld select 2) + 0.5];
	_x setPosATL _posRelativeToWorld;
	_x hideObjectGlobal true;
} forEach (_building getVariable "dz_house_weaponholders");

// Hide levels of building according to building level
if (_level == 1) then {
	_building animate ["level_2_hide",1,true];
	_building animate ["level_3_hide",1,true];
};
if (_level == 2) then {
	_building animate ["level_3_hide",1,true];
};

// Enable saving
[[_building],{
	(_this select 0) addAction ["Save",{
		[_this select 0] remoteExec ["dz_fnc_saveBuilding",2];
		[format ["<t color='#00EE1A'>%1 has been synced with the database (ID %2)</t>",getText(configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "displayName"),(_this select 0) getVariable ["BuildingID",-1]]] call dz_fnc_addToFeed;
	},nil,1.5,true,true,"","!isNull _target AND (player distance _target) < 3 AND (vehicle player == player)"];
}] remoteExec ["BIS_FNC_SPAWN",0];

diag_log format ["DSL-SAVE: %1",_level];

// Fill building with items...
for "_i" from 1 to _amountWeaponHolders step 1 do
{
	_tmpInv = _inventory select (_i - 1);
	_box = (_building getVariable "dz_house_weaponholders") select (_i - 1);

	_weapons = _tmpInv select 0;
	_magazines = _tmpInv select 1;
	_items = _tmpInv select 2;
	_backpacks = _tmpInv select 3;

	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearItemCargoGlobal _box;
	clearBackpackCargoGlobal _box;

	for "_i" from 0 to (count (_weapons select 0) - 1) step 1 do
	{
		_box addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i];
	};
	for "_i" from 0 to (count (_magazines select 0) - 1) step 1 do
	{
		_box addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i];
	};
	for "_i" from 0 to (count (_items select 0) - 1) step 1 do
	{
		_box addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i];
	};
	for "_i" from 0 to (count (_backpacks select 0) - 1) step 1 do
	{
		_box addBackpackCargoGlobal [(_backpacks select 0) select _i,(_backpacks select 1) select _i];
	};
};

// Save to database
[[_building],{dz_sv_buildings pushBack (_this select 0)}] remoteExec ["BIS_FNC_SPAWN",2];

// Reset position
//_building setPos getPos _building;

//_building spawn {
//	uiSleep 60;
//	_this setPos getPos _this;
//};

diag_log format ["DSL-SAVE: DONE"];

diag_log format ["==========================="];

if (_creation) then {
	// Check if tent exists in database
	_query = format["SELECT Type, Inventory, PosAndDir FROM buildings WHERE ID='%1'",_ID];
	_functionToCall = {};
	if (isServer) then {
		_functionToCall = dz_fnc_asyncCall;
	} else {
		_functionToCall = dzhc_fnc_executeQuery;
	};
	_buildingResult = [_query,2] call _functionToCall;

	if (count _buildingResult < 1) then {
		_query = format["INSERT INTO buildings(Type, Inventory, PosAndDir, WhitelistedUIDs) VALUES ('%1','%2','%3','%4')",_classname,str(_inventory),str ([_positionATL,_direction]),([true,str(_building getVariable ["dz_whitelisted_UIDs",[]])] call dz_fnc_prepareString)];
		[_query,1] call _functionToCall;
		// ["SELECT ID FROM buildings ORDER BY ID DESC LIMIT 1",2] call dz_fnc_asyncCall
		uiSleep 1;
		_query = format["SELECT ID FROM buildings ORDER BY ID DESC LIMIT 1"];
		_highestID = ([_query,2] call _functionToCall) select 0;
		_myID = _highestID;
		_building setVariable ["BuildingID",_myID,true];
	};
};
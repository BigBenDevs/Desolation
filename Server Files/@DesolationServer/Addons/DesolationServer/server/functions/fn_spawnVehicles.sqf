scriptName "fn_spawnVehicles";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_spawnVehicles.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_spawnVehicles.sqf"

// Parameters
sleep 20;

// Exceptions
dz_sv_vehicles = [];

// Code
_query = format["SELECT Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive FROM vehicles WHERE ID='1'"];
_testVehicle = [_query,2] call dz_fnc_asyncCall;

_usedSpawnpoints = [];

if (count _testVehicle > 0) then {
	for "_i" from 1 to (dz_sv_vehicleAmountTotal + dz_sv_AircraftAmountTotal + dz_sv_boatAmountTotal) step 1 do
	{
		_query = format["SELECT Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive, Fuel FROM vehicles WHERE ID='%1'",_i];
		_vehicleData = [_query,2] call dz_fnc_asyncCall;

		{
			_vehicleData set [_forEachIndex,if(typeName _x == typeName "" AND _forEachIndex != 0) then {call compile ([false,_x] call dz_fnc_prepareString)} else {_x}];
		} forEach (_vehicleData);

		_vehicle = objNull;
		// Create vehicle
		_toPos = [];
		_toDir = [];
		// If vehicle damage equals 1 or its position is underwater respawn, if not just spawn
		if ((_vehicleData select 5) == 1 AND (ATLToASL ((_vehicleData select 2) select 0)) select 2 > -4) then {
			_vehicle = (_vehicleData select 0) createVehicle ((_vehicleData select 2) select 0);
			_toPos = ((_vehicleData select 2) select 0);
			_toDir = ((_vehicleData select 2) select 1);
		} else {
			_vehicle = (_vehicleData select 0) createVehicle ((_vehicleData select 1) select 0);
			_toPos = ((_vehicleData select 1) select 0);
			_toDir = ((_vehicleData select 1) select 1);

			_damageData = _vehicleData select 3;
			{
				_damageData set [_forEachIndex,random 1];
			} forEach _damageData;
			_vehicleData set[3,_damageData];
		};

		// Get hit points

		_hitPoints = [];
		{
			if ((_x select 0) == (_vehicleData select 0)) then {
				_hitPoints = (_x select 1);
			};
		} forEach dz_sv_vehicleHitPoints;
		if (count _hitPoints == 0) then {
			_hitPoints = dz_sv_vehicleHitPointsDefault;
		};

		for "_i" from 0 to (count _hitPoints - 1) step 1 do
		{
			if (_hitPoints select _i != "NOENTRY") then {
				_vehicle setHitPointDamage [(_hitPoints select _i),(_vehicleData select 3) select _i];
			};
		};

		// Give godmode for 5 min
		_vehicle allowDamage false;
		_vehicle setPosATL _toPos;
		_vehicle setDir _toDir;
		_vehicle spawn {
			uisleep 300;
			_this allowDamage true;
		};

		// Set information on vehicle
		_vehicle setVariable ["ID",_i,true];

		// Disable TI and NVG
		_vehicle disableTIEquipment true;
		_vehicle disableNVGEquipment true;

		_vehicle addEventHandler ["Killed",{
			_vID = (_this select 0) getVariable ["ID",0];
			_query = format[
				"UPDATE vehicles SET Alive='0' WHERE ID='%1'",
				_vID
			];
			[_query,1] call dz_fnc_asyncCall;
		}];

		// Load inventory
		_inv = _vehicleData select 4;
		_weapons = _inv select 0;
		_magazines = _inv select 1;
		_items = _inv select 2;
		_backpacks = _inv select 3;

		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;

		for "_i" from 0 to (count (_weapons select 0) - 1) step 1 do
		{
			_vehicle addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i];
		};
		for "_i" from 0 to (count (_magazines select 0) - 1) step 1 do
		{
			_vehicle addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i];
		};
		for "_i" from 0 to (count (_items select 0) - 1) step 1 do
		{
			_vehicle addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i];
		};
		for "_i" from 0 to (count (_backpacks select 0) - 1) step 1 do
		{
			_vehicle addBackpackCargoGlobal [(_backpacks select 0) select _i,(_backpacks select 1) select _i];
		};

		dz_sv_vehicles pushBack _vehicle;

		// Set Fuel
		_vehicle setFuel (_vehicleData select 6);

		//_positionCurrent = getPos _vehicle;
		//_positionCurrent set [2,1];
		//_vehicle setPos _positionCurrent;

		// Make vehicle spawn abit higher in order for it to prevent it get stuck in the ground
	};
	dz_sv_vehicles_lastSync = diag_tickTime;
	[] spawn {
		while {true} do {
			if (diag_tickTime - dz_sv_vehicles_lastSync > 100) then {
				dz_sv_vehicles_lastSync = diag_tickTime;
				{
					[_x] spawn dz_fnc_saveVehicle;
					uiSleep 0.3;
				} forEach dz_sv_vehicles;

				{
					[_x] spawn dz_fnc_saveTent;
					uiSleep 0.3;
				} forEach dz_sv_tents;
				{
					[_x] spawn dz_fnc_saveBuilding;
					uiSleep 0.3;
				} forEach dz_sv_buildings;
			};
		};
	};
} else {
	// Spawn 20 vehicles + helicopters
	for "_i" from 1 to (dz_sv_vehicleAmountTotal) step 1 do
	{
		sleep 0.5;
		// Random vehicle type
		_typeToSpawn = dz_sv_vehicleTypes select (floor(random(count dz_sv_vehicleTypes - 1)));
		systemChat _typeToSpawn;
		// Get random spawnpoint
		_spawnpointfound = false;
		_spawnpoint = "";
		while {!_spawnpointfound} do {
			_rSP = dz_sv_spawnpoints select (floor(random(count dz_sv_spawnpoints - 1)));
			if !(_rSP in _usedSpawnpoints) then {
				_usedSpawnpoints pushBack _rSP;
				_spawnpointfound = true;
				_spawnpoint = _rSP;
			};
		};

		_position = getMarkerPos _spawnpoint;
		_direction = markerDir _spawnpoint;

		// Get hit points
		_hitPoints = [];
		{
			if ((_x select 0) == _typeToSpawn) then {
				_hitPoints = (_x select 1);
			};
		} forEach dz_sv_vehicleHitPoints;
		if (count _hitPoints == 0) then {
			_hitPoints = dz_sv_vehicleHitPointsDefault;
		};

		// Create hitpoint array for database
		_hitPointArray = [];
		for "_i" from 0 to (count _hitPoints) step 1 do
		{
			if ((_hitPoints select _i) != "HitFuel") then {
				if ((_hitPoints select _i) in ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitLMWheel","HitRMWheel"]) then {
					_r = random 1.5;
					if (_r > 1) then {_r = 1};
					_hitPointArray pushBack (_r);
				} else {
					_hitPointArray pushBack (random 1);
				};
			} else {
				_hitPointArray pushBack (random 0.7);
			};
		};

		// Insert into database
		_query = format["INSERT INTO vehicles(Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive, Fuel) VALUES ('%1','%2','%3','%4','%5','%6','%7')",_typeToSpawn,str([_position,_direction]),str([_position,_direction]),str(_hitPointArray),"[[[],[]],[[],[]],[[],[]],[[],[]]]",1,str(random 1)];
		diag_log _query;
		[_query,1] call dz_fnc_asyncCall;

	};

	// Spawn aircrafts
	{
		_query = format["INSERT INTO vehicles(Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive, Fuel) VALUES ('%1','%2','%3','%4','%5','%6','%7')",(_x select 1),(_x select 0),(_x select 0),str(_x select 2),"[[[],[]],[[],[]],[[],[]],[[],[]]]",1,str(random 1)];
		[_query,1] call dz_fnc_asyncCall;
	} forEach dz_sv_helis_info;

	// Spawn boats
	{
		_query = format["INSERT INTO vehicles(Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive, Fuel) VALUES ('%1','%2','%3','%4','%5','%6','%7')",(_x select 1),(_x select 0),(_x select 0),str(_x select 2),"[[[],[]],[[],[]],[[],[]],[[],[]]]",1,str(random 1)];
		[_query,1] call dz_fnc_asyncCall;
	} forEach dz_sv_boats_info;

	// Spawn special vehicles
	{
		_query = format["INSERT INTO vehicles(Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive, Fuel) VALUES ('%1','%2','%3','%4','%5','%6','%7')",(_x select 1),(_x select 0),(_x select 0),str(_x select 2),"[[[],[]],[[],[]],[[],[]],[[],[]]]",1,str(random 1)];
		[_query,1] call dz_fnc_asyncCall;
	} forEach dz_sv_specialVehicle_info;

	// Execute this file again to spawn them in
	[] spawn {
		uisleep 3;
		[] call dz_fnc_spawnVehicles;
	};
};
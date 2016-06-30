scriptName "fn_createLootPile";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_createLootPile.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_createLootPile.sqf"

// Parameters
_position = param[0,[0,0,0],[[]]];
_house = param[1,objNull,[objNull]];

// Exceptions
if (_position isEqualTo [0,0,0]) exitWith {};
if (isNull _house) exitWith {};

// Check if theres already a lootpile within 1 meter to fix buggy loot piles
_list = nearestObjects [_position, ["GroundWeaponHolder"], 1.5];
if (count _list > 0) exitWith {};

// Code
_typeOfHouse = typeOf _house;
_category = "";
_types = [
	"WEAPONS",
	"MAGAZINES",
	"ITEMS",
	"BACKPACKS",
	"CLOTHING"
];
_typeToSpawn = "";
_multiplicator = 0;

// Determine House Type
if (_typeOfHouse in dz_sv_loot_residential_types) then {
	_category = "RESIDENTIAL";
	_multiplicator = dz_sv_loot_multiplicator select 0;
};
if (_typeOfHouse in dz_sv_loot_industrial_types) then {
	_category = "INDUSTRIAL";
	_multiplicator = dz_sv_loot_multiplicator select 1;
};
if (_typeOfHouse in dz_sv_loot_military_types) then {
	_category = "MILITARY";
	_multiplicator = dz_sv_loot_multiplicator select 3;
};
if (_typeOfHouse in dz_sv_loot_medical_types) then {
	_category = "MEDICAL";
	_multiplicator = 0;
};
if (_typeOfHouse in dz_sv_loot_lowmilitary_types) then {
	_category = "LOW_MILITARY";
	_multiplicator = dz_sv_loot_multiplicator select 2;
};

/*if (_category == "MILITARY") then {
	if (((getPos _house) select 1) < 4500) then {
		if ((random 1) < 0.6) exitWith {
			true
		};
	};
};*/

// Check if there are too many weaponholders
_arr = allMissionObjects "GroundWeaponHolder";
_c = count _arr;
if (_c > dz_sv_maxGroundWeaponHolders - 1) then {
	for "_i" from 1 to (_c - dz_sv_maxGroundWeaponHolders - 1) step 1 do
	{
		deleteVehicle (_arr call BIS_fnc_selectRandom);
	};
};

_wh = objNull;

if (_category == "MEDICAL") then {
	_lootTable = dz_sv_loot_medical_table;
	_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];

	_amountOfItems = (round(random 5))+1;
	for "_i" from 1 to _amountOfItems step 1 do
	{
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Item
			_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};
};

// Spawn Loot
if (_category == "LOW_MILITARY") then {
	// Determine what kind of loot to spawn
	//diag_log "RESIDENTIAL";
	_randomVar = random 101;
	{
		if (_randomVar >= (_x select 0) AND _randomVar < (_x select 1)) then {_typeToSpawn = _types select _forEachIndex};
	} forEach dz_sv_loot_lowmilitary_table_chances;

	if (_typeToSpawn == "WEAPONS") then {
		_lootTable = dz_sv_loot_lowmilitary_table select 0;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Weapon
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addWeaponCargoGlobal [(_itemToSpawnArray select 0),1];
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			// Spawn Ammunition
			_magazine = ([(_itemToSpawnArray select 0)] call dz_fnc_itemDetails select 7) select 0;
			if (!isNil "_magazine") then {
				_wh addMagazineCargoGlobal [_magazine,round(random 3)];
			};
		};
	};

	if (_typeToSpawn == "MAGAZINES") then {
		_lootTable = dz_sv_loot_lowmilitary_table select 1;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Magazine(s)
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addMagazineCargoGlobal [(_itemToSpawnArray select 0),round(random 3)];
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
		};
	};

	if (_typeToSpawn == "ITEMS") then {
		_lootTable = dz_sv_loot_lowmilitary_table select 2;
		_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
		//dz_sv_loot_weaponHolders pushBack _wh;
		_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
		//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
		_amountOfItems = (round(random 3))+1;
		for "_i" from 1 to _amountOfItems step 1 do
		{
			_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
			if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
				// Spawn Item
				_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
			};
		};
	};

	if (_typeToSpawn == "BACKPACKS") then {
		_lootTable = dz_sv_loot_lowmilitary_table select 3;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Backpack
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addBackpackCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};

	if (_typeToSpawn == "CLOTHING") then {
		_lootTable = dz_sv_loot_lowmilitary_table select 4;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Clothing
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};
};

// Spawn Loot
if (_category == "RESIDENTIAL") then {
	// Determine what kind of loot to spawn
	//diag_log "RESIDENTIAL";
	_randomVar = random 101;
	{
		if (_randomVar >= (_x select 0) AND _randomVar < (_x select 1)) then {_typeToSpawn = _types select _forEachIndex};
	} forEach dz_sv_loot_residential_table_chances;

	if (_typeToSpawn == "WEAPONS") then {
		_lootTable = dz_sv_loot_residential_table select 0;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Weapon
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addWeaponCargoGlobal [(_itemToSpawnArray select 0),1];
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			// Spawn Ammunition
			_magazine = ([(_itemToSpawnArray select 0)] call dz_fnc_itemDetails select 7) select 0;
			if (!isNil "_magazine") then {
				_wh addMagazineCargoGlobal [_magazine,round(random 3)];
			};
		};
	};

	if (_typeToSpawn == "MAGAZINES") then {
		_lootTable = dz_sv_loot_residential_table select 1;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Magazine(s)
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addMagazineCargoGlobal [(_itemToSpawnArray select 0),round(random 3)];
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
		};
	};

	if (_typeToSpawn == "ITEMS") then {
		_lootTable = dz_sv_loot_residential_table select 2;
		_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
		//dz_sv_loot_weaponHolders pushBack _wh;
		_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
		//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
		_amountOfItems = (round(random 3))+1;
		for "_i" from 1 to _amountOfItems step 1 do
		{
			_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
			if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
				// Spawn Item
				_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
			};
		};
	};

	if (_typeToSpawn == "BACKPACKS") then {
		_lootTable = dz_sv_loot_residential_table select 3;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Backpack
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addBackpackCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};

	if (_typeToSpawn == "CLOTHING") then {
		_lootTable = dz_sv_loot_residential_table select 4;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Clothing
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};
};

if (_category == "INDUSTRIAL") then {
	//diag_log "INDUSTRIAL";
	// Determine what kind of loot to spawn
	_randomVar = random 101;
	{
		if (_randomVar >= (_x select 0) AND _randomVar < (_x select 1)) then {_typeToSpawn = _types select _forEachIndex};
	} forEach dz_sv_loot_industrial_table_chances;

	if (_typeToSpawn == "WEAPONS") then {
		_lootTable = dz_sv_loot_industrial_table select 0;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Weapon
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addWeaponCargoGlobal [(_itemToSpawnArray select 0),1];
			// Spawn Ammunition
			_magazine = ([(_itemToSpawnArray select 0)] call dz_fnc_itemDetails select 7) select 0;
			if (!isNil "_magazine") then {
				_wh addMagazineCargoGlobal [_magazine,round(random 3)];
			};
		};
	};

	if (_typeToSpawn == "MAGAZINES") then {
		_lootTable = dz_sv_loot_industrial_table select 1;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Magazine(s)
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addMagazineCargoGlobal [(_itemToSpawnArray select 0),round(random 3)];
		};
	};

	if (_typeToSpawn == "ITEMS") then {
		_lootTable = dz_sv_loot_industrial_table select 2;
		_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
		//dz_sv_loot_weaponHolders pushBack _wh;
		//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
		_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
		_amountOfItems = (round(random 3))+1;
		for "_i" from 1 to _amountOfItems step 1 do
		{
			_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
			if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
				// Spawn Item
				_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
			};
		};
	};

	if (_typeToSpawn == "BACKPACKS") then {
		_lootTable = dz_sv_loot_industrial_table select 3;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Backpack
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addBackpackCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};

	if (_typeToSpawn == "CLOTHING") then {
		_lootTable = dz_sv_loot_industrial_table select 4;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Clothing
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};
};

if (_category == "MILITARY") then {

	//diag_log "MILITARY";
	// Determine what kind of loot to spawn
	_randomVar = random 101;
	{
		if (_randomVar >= (_x select 0) AND _randomVar < (_x select 1)) then {_typeToSpawn = _types select _forEachIndex};
	} forEach dz_sv_loot_military_table_chances;

	if (_typeToSpawn == "WEAPONS") then {
		_lootTable = dz_sv_loot_military_table select 0;
		_itemToSpawnArray = ["",0];
		while {(_itemToSpawnArray select 1) == 0} do {
			_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		};
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Weapon
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addWeaponCargoGlobal [(_itemToSpawnArray select 0),1];
			// Spawn Ammunition
			_magazine = ([(_itemToSpawnArray select 0)] call dz_fnc_itemDetails select 7) select 0;
			if (!isNil "_magazine") then {
				_wh addMagazineCargoGlobal [_magazine,round(random 3)];
			};
		};
	};

	if (_typeToSpawn == "MAGAZINES") then {
		_lootTable = dz_sv_loot_military_table select 1;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Magazine(s)
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addMagazineCargoGlobal [(_itemToSpawnArray select 0),round(random 3)];
		};
	};

	if (_typeToSpawn == "ITEMS") then {
		_lootTable = dz_sv_loot_military_table select 2;
		_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
		//dz_sv_loot_weaponHolders pushBack _wh;
		//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
		_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
		_amountOfItems = (round(random 3))+1;
		for "_i" from 1 to _amountOfItems step 1 do
		{
			_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
			if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
				// Spawn Item
				_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
			};
		};
	};

	if (_typeToSpawn == "BACKPACKS") then {
		_lootTable = dz_sv_loot_military_table select 3;
		_itemToSpawnArray = _lootTable call BIS_FNC_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Backpack
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addBackpackCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};

	if (_typeToSpawn == "CLOTHING") then {
		_lootTable = dz_sv_loot_military_table select 4;
		_itemToSpawnArray = _lootTable call BIS_fnc_selectRandom;
		if ((random 1) <= ((_itemToSpawnArray select 1) + _multiplicator)) then {
			// Spawn Clothing
			_wh = createVehicle ["groundWeaponHolder", _position, [], 0, "CAN_COLLIDE"];
			//dz_sv_loot_weaponHolders pushBack _wh;
			//_house setVariable ["lootSpots",(_house getVariable ["lootSpots",[]]) + [_wh], true];
			_newPos = ([_position] call dz_fnc_lowestPosition);_newPos set[2,(_newPos select 2)+0.05];_wh setPos _newPos;
			_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};
};

//_wh setVariable ["house",_house,true];
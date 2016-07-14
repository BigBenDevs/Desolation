if (isDedicated) exitWith {};scriptName "fn_createZombieLoot";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_createZombieLoot.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_createZombieLoot.sqf"

// Parameters
_zombie = param[0,objNull,[objNull]];

systemChat "0";

// Exceptions
if (isNull _zombie) exitWith {systemChat "1"};

// Code
_typeToSpawn = "";
_types = [
	"WEAPONS",
	"MAGAZINES",
	"ITEMS",
	"BACKPACKS",
	"CLOTHING"
];

// Determine what kind of loot to spawn
_randomVar = random 101;
{
	if (_randomVar >= (_x select 0) AND _randomVar < (_x select 1)) then {_typeToSpawn = _types select _forEachIndex};
} forEach dz_sv_loot_residential_table_chances;

if (_typeToSpawn == "WEAPONS") then {
	_lootTable = dz_sv_loot_residential_table select 0;
	_itemToSpawnArray = _lootTable select (floor(random (count _lootTable - 1)));
	if ((random 1) <= (_itemToSpawnArray select 1)) then {
		_wh = createVehicle ["groundWeaponHolder", getPos _zombie, [], 0, "CAN_COLLIDE"];
		_pos = getPosATL _zombie;
		systemChat "2";
		_pos set [0,(_pos select 0) - 1.5 + (random 3)];
		_pos set [1,(_pos select 1) - 1.5 + (random 3)];
		_wh setPosATL _pos;
		_wh addWeaponCargoGlobal [(_itemToSpawnArray select 0),1];
	};
};

if (_typeToSpawn == "MAGAZINES") then {
	_lootTable = dz_sv_loot_residential_table select 1;
	_itemToSpawnArray = _lootTable select (floor(random (count _lootTable - 1)));
	if ((random 1) <= (_itemToSpawnArray select 1)) then {
		_wh = createVehicle ["groundWeaponHolder", getPos _zombie, [], 0, "CAN_COLLIDE"];
		_pos = getPosATL _zombie;
		systemChat "3";
		_pos set [0,(_pos select 0) - 1.5 + (random 3)];
		_pos set [1,(_pos select 1) - 1.5 + (random 3)];
		_wh setPosATL _pos;
		_wh addMagazineCargoGlobal [(_itemToSpawnArray select 0),1];
	};
};

if (_typeToSpawn == "ITEMS") then {
	_lootTable = dz_sv_loot_residential_table select 2;
	_amountOfItems = (round(random 2))+1;
	for "_i" from 1 to _amountOfItems step 1 do
	{
		_itemToSpawnArray = _lootTable select (floor(random (count _lootTable - 1)));
		if ((random 1) <= (_itemToSpawnArray select 1)) then {
			_wh = createVehicle ["groundWeaponHolder", getPos _zombie, [], 0, "CAN_COLLIDE"];
			_pos = getPosATL _zombie;
			_pos set [0,(_pos select 0) - 1.5 + (random 3)];
			_pos set [1,(_pos select 1) - 1.5 + (random 3)];
			_wh setPosATL _pos;
			systemChat "4";
			_wh addItemCargoGlobal [(_itemToSpawnArray select 0),1];
		};
	};
};
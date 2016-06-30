scriptName "fn_initializeTent";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_initializeTent.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_initializeTent.sqf"

//TODO "Land_radio_box"

// Parameters
_ID = param[0,-1,[0]];
_position = param[1,[],[[]]];
_direction = param[2,0,[0]];
_inventory = param[3,[[[],[]],[[],[]],[[],[]],[[],[]]],[[]]];
_tentCreation = param[4,false,[true]];
_structureClassname = param[5,"DayZero_Object_OldTent",[""]];

// Exceptions
if (_ID == -1 AND !_tentCreation) exitWith {};

// Code
_tent = createVehicle [_structureClassname, _position, [], _direction, "CAN_COLLIDE"];
_tent setPosATL [_position select 0,_position select 1,0];
_tent setDir _direction;
_tent setPos getPos _tent;
_tent setVariable ["TentID",_ID,true];

diag_log format ["CREATING TENT AT %1",getPos _tent];

diag_log format ["======   TENT  SYS  ======="];
diag_log format ["DSL-SAVE: Trying to load tent with ID %1",_ID];

_box = objNull;
if (_structureClassname == "DayZero_Object_OldTent") then {
	/*// Spawn Box for Tent
	_box = createVehicle ["DayZero_Object_OldTentBox", _position, [], _direction, "CAN_COLLIDE"];
	_box setPosATL [_position select 0,_position select 1,0];
	_box setDir _direction;
	_tent setVariable ["box",_box,true];*/

	// Item box became obsolete with path 0.56A
	_box = _tent;
};
if (_structureClassname == "DayZero_Object_SmallStash") then {
	_box = _tent;
};

diag_log format ["DSL-SAVE: %1",typeOf _tent];

// Make them indestructible
_tent allowDamage false;
//_tent enableSimulationGlobal false;

// Unpack option for tent
// Pack option
if (_structureClassname == "DayZero_Object_OldTent") then {
	[[_tent],{
		(_this select 0) setVariable ["dz_tentHasOption",true];
		(_this select 0) addAction ["Pack Tent",{
			_this spawn {
				closeDialog 0;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				dz_inAction = true;
				[player,"z_tentpack_0"] remoteExec ["say3D"];
				uisleep 5;
				dz_inAction = false;
				_wh = createVehicle ["groundWeaponHolder", getpos player, [], 0, "CAN_COLLIDE"];
				_wh setPosATL getPosATL player;
				_wh addItemCargoGlobal ["DayZero_Item_Tent",1];
				["<t color='#A3FB26'>I have packed the tent</t>"] call dz_fnc_addToFeed;
				_tent = _this select 0;
				_tentID = _tent getVariable ["TentID",-1];
				//deleteVehicle (_tent getVariable ["box",objNull]); // OBSOLETE AFTER 0.56A
				deleteVehicle _tent;
				[_tentID] remoteExec ["dz_fnc_removeTent",2];
			};
		},nil,1.5,true,true,"","(player distance _target < 4) AND (vehicle player == player)"];
	}] remoteExec ["BIS_FNC_SPAWN",0];
};

// Enable saving
[[_tent],{
	(_this select 0) addAction ["Save",{
		[_this select 0] remoteExec ["dz_fnc_saveTent",2];
		[format ["<t color='#00EE1A'>%1 has been synced with the database (ID %2)</t>",getText(configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "displayName"),(_this select 0) getVariable ["TentID",-1]]] call dz_fnc_addToFeed;
	},nil,1.5,true,true,"","!isNull _target AND (player distance _target) < 3 AND (vehicle player == player)"];
}] remoteExec ["BIS_FNC_SPAWN",0];

// Load Inventory
_inv = _inventory;
_weapons = _inv select 0;
_magazines = _inv select 1;
_items = _inv select 2;
_backpacks = _inv select 3;

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

diag_log format ["DSL-SAVE: %1",_inventory];

//
dz_sv_tents pushBack _tent;

if (_tentCreation) then {
	// Check if tent exists in database
	_query = format["SELECT Type, Inventory, PosAndDir FROM tents WHERE ID='%1'",_ID];
	_tentResult = [_query,2] call dz_fnc_asyncCall;

	if (count _tentResult < 1) then {
		_query = format["INSERT INTO tents(Type, Inventory, PosAndDir) VALUES ('%1','%2','%3')",_structureClassname,"[[[],[]],[[],[]],[[],[]],[[],[]]]",str ([_position,_direction])];
		[_query,1] call dz_fnc_asyncCall;

		_query = format["SELECT ID FROM tents ORDER BY ID DESC LIMIT 1"];
		_highestID = ([_query,2] call dz_fnc_asyncCall) select 0;
		_myID = _highestID;
		_tent setVariable ["TentID",_myID,true];
	};
};

diag_log format ["==========================="];
if (isDedicated) exitWith {};scriptName "fn_evaluatePlayerData";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_evaluatePlayerData.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_evaluatePlayerData.sqf"

// Parameters
diag_log "Evaluating";

// Exceptions
if (isNull player) exitWith {};

// Code
if (dz_PositionATL_Dir isEqualTo [[0,0,0],0,0] OR dz_Alive == 0 OR (dz_PositionATL_Dir select 2) == 1) then {
	// Player seems to have died, reset vars
	dz_PositionATL_Dir = [];
	dz_Inventory = [];
	dz_Alive = 1;
	dz_brokenLegs = false;

	// Health
	dz_thirst = 100;
	dz_hunger = 100;

	// Stats
	dz_TimeSurvived = 0;
	dz_lastTimeCheck = diag_tickTime;
	dz_ZombiesKilled = 0;

	// Get random spawnpoint
	_spawnpoint = format ["dz_spawn_%1",(floor random (dz_countSpawns + 1))];
	_spawnpointPos = getMarkerPos _spawnpoint;

	// Prepare player
	removeAllWeapons player;
	removeUniform player;
	removeGoggles player;
	removeAllItems player;
	removeBackpackGlobal player;
	removeVest player;
	removeHeadgear player;
	removeAllAssignedItems player;

	player addBackpack "CUP_B_AssaultPack_Coyote";
	player forceAddUniform (dz_clothes select (round (random (count dz_clothes))));

	// Set player position
	dz_pos = _spawnpointPos;
	dz_dir = (random 361);
	dz_newSpawn = true;

	dz_brokenLegs = false;
	player setVariable ["brokenLegs",nil,true];
	player setDamage 0;

	//[] spawn {uisleep 0.5;player forceAddUniform (dz_clothes select (round (random (count dz_clothes))));for "_i" from 1 to 4 do {player addMagazine "CUP_8Rnd_9x18_Makarov_M";};};

} else {
	// Player seems to be alive, set his position, gear, direction, etc.
	//player setPosATL (dz_PositionATL_Dir select 0);
	//player setDir (dz_PositionATL_Dir select 1);
	dz_pos = (dz_PositionATL_Dir select 0);
	dz_dir = (dz_PositionATL_Dir select 1);
	player setDamage (dz_PositionATL_Dir select 2);
	if (dz_brokenLegs) then {
		player setHitPointDamage ["HitLegs",1];
		player setVariable ["brokenlegs",true,true];
	} else {
		player setHitPointDamage ["HitLegs",0];
	};

	_nil = call dz_fnc_loadInventory;
};

//player enableSimulation true;
//player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon";
call dz_fnc_getWeapons;
if (dz_primaryWeapon != "") then {player switchMove "Acts_AidlPercMstpSlowWrflDnon_warmup04";};
if (dz_secondaryWeapon != "" AND dz_primaryWeapon == "") then {player playMoveNow "AidlPercMstpSlowWpstDnon_G01";};
if (dz_primaryWeapon == "" AND dz_secondaryWeapon == "") then {player playMoveNow "AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon"};

//[] spawn dz_fnc_loadObjects;
playMusic "intro_track";
[] spawn dz_fnc_SpawnMenu;
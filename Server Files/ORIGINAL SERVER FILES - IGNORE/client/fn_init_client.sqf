if (isDedicated) exitWith {};scriptName "init_client";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: init_client.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "init_client.sqf"

// Wait for server to be ready
//startLoadingScreen ["Loading Client"];

diag_log "Waiting for server to be ready...";
waitUntil {!isNil "dz_serverReady"};
//progressLoadingScreen 0.1;
1000 cutRsc ["blackbackground","PLAIN"];
player allowDamage false;

uisleep 3;
waitUntil {!isNull player};

// Check for outdated client files by checking for outdated vars on buildings
[] spawn dz_fnc_clientHouseOutdatedCheck;

// Check for corrupted functions
if (!isServer) then {
	{
		if (isNil {missionNamespace getVariable ("dz_fnc_" + _x)}) then {
			[[player,("dz_fnc_" + _x)],{
				(owner (_this select 0)) publicVariableClient (_this select 1);
			}] remoteExec ["BIS_FNC_SPAWN",2];
			systemChat "Function was corrupt... resending information";
			uisleep 3;
			systemChat "Function received";
		};
	} forEach dz_sv_functionsToCheck;
};

[[player],{(_this select 0) enableSimulationGlobal true;}] remoteExecCall ["BIS_FNC_SPAWN",2];

// Execute basic configuration
call dz_fnc_configuration;
diag_log "dz_fnc_configuration";
//progressLoadingScreen 0.2;

// Load player data
call dz_fnc_requestData;
diag_log "dz_fnc_requestData";
//progressLoadingScreen 0.3;

// Wait for data to arrive
dz_waitingSince = diag_tickTime;
[] spawn {
	uisleep 10;
	if (isNil "dz_playerStatsReceived") then {
		endMission "Unable to receive character data";
	};
};
waitUntil {!isNil "dz_playerStatsReceived"};
diag_log "dz_playerStatsReceived";
//progressLoadingScreen 0.4;

// Anti Side CHat
[] spawn dz_fnc_antiSideChat;

// Check player data if a respawn is necessary or just load the player in
call dz_fnc_evaluatePlayerData;
diag_log "dz_fnc_evaluatePlayerData";

// Make the hatchet work
player addEventhandler ["Fired",{
	if ((_this select 1) == "meleehatchet") then {
		//[player,"GestureSwing"] remoteExecCall ["playActionNow"];
		player playActionNow "GestureSwing";
	};
}];

// Make the custom map work
[] spawn dz_fnc_overwriteMapDialog;

// Close Loading Screen and fade in
titleText ["", "BLACK IN", 7];
//endLoadingScreen;

// Save buildings when closing their loot
dz_sv_buildings_lastTimeManuallySaved = -999;
player addEventHandler ["InventoryClosed",{
	if (typeOf (_this select 1) == "DayZero_Object_PersistentWeaponHolder") then {
		_list = nearestObjects [player, dz_sv_buildings_types, 10];
		_obj = _list select 0;
		if (!isNil {_obj getVariable "BuildingID"}) then {
			if (diag_tickTime - dz_sv_buildings_lastTimeManuallySaved > 5) then {
				[_obj] remoteExec ["dz_fnc_saveBuilding",2];
				dz_sv_buildings_lastTimeManuallySaved = diag_tickTime;
			};
		};
	};
}];

diag_log "Continue....";

// Spawn ground fog
//null = [player,100,7,70,15,15,5,0.1,0.3,1,1,1,13,6,6,true,2,2.1,0.1,0,0,0,6,7] execFSM "Fog.fsm";

// Add Keyhandler
waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call dz_fnc_keyHandler"];

// HandleDamage
player addEventHandler ["handleDamage",{
	diag_log format ["DAMAGE RECEIVED: %1",_this];
	if ((_this select 1) == "legs" AND isPlayer (_this select 0)) then {
		_r = random 100;
		if (_r < 20) then {
			[] spawn dz_fnc_breakLegs;
			[false] spawn dz_fnc_hitEffect;
		};
	};
}];
player addEventHandler ["Hit",{
	if (!(player getVariable ["bleeding",false]) AND ((random 100) < 30)) then {
		player setVariable ["bleeding",true,true];
		addCamShake [4, 9999, 0.5];
		["<t color='#D90C01'>I am bleeding</t>"] remoteExec ["dz_fnc_addToFeed",player];
	};
	[false] spawn dz_fnc_hitEffect;
}];

diag_log "Continue....";

// Duh.. ArmA
player addRating 99999999;

// Make tents packable
{
	if (isNil {_x getVariable "dz_tentHasOption"}) then {
		_x addAction ["Pack Tent",{
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
				//deleteVehicle (_tent getVariable ["box",objNull]); // obsolete after 0.56A
				deleteVehicle _tent;
				[_tentID] remoteExec ["dz_fnc_removeTent",2];
			};
		},nil,1.5,true,true,"","(player distance _target < 4) AND (!isNil {_target getVariable 'TentID'})"];
	};
} forEach (allMissionObjects "DayZero_Object_OldTent");

// Create status tracker/feed
uisleep 4;
200 cutRsc["statusFeed","PLAIN"];
diag_log "Continue....";

// Chemlights
player addAction ["Extinguish Chemlight",{
	deleteVehicle (player getVariable ["chemlight",objNull]);
	player setVariable ["chemlight",objNull];
},nil,1.5,true,true,"","!isNull (player getVariable ['chemlight',objNull])"];

[] spawn {
	sleep 25;
	// Enable manual save for vehicles, tents, stashes and stuff
	{
		_x addAction ["Save",{
			[_this select 0] remoteExec ["dz_fnc_saveVehicle",2];
			[format ["<t color='#00EE1A'>%1 has been synced with the database (ID %2)</t>",getText(configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "displayName"),(_this select 0) getVariable ["ID",-1]]] call dz_fnc_addToFeed;
		},nil,1.5,true,true,"","!isNull _target AND (player distance _target) < 6 AND (vehicle player == player)"];
	} forEach (AllMissionObjects "Ship" + AllMissionObjects "Car" + AllMissionObjects "Air");
};

{
	_x addAction ["Save",{
		[_this select 0] remoteExec ["dz_fnc_saveTent",2];
		[format ["<t color='#00EE1A'>%1 has been synced with the database (ID %2)</t>",getText(configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "displayName"),(_this select 0) getVariable ["TentID",-1]]] call dz_fnc_addToFeed;
	},nil,1.5,true,true,"","!isNull _target AND (player distance _target) < 3 AND (vehicle player == player)"];
} forEach (AllMissionObjects "DayZero_Object_OldTent" + AllMissionObjects "DayZero_Object_SmallStash");

{
	{
		_x addAction ["Save",{
			[_this select 0] remoteExec ["dz_fnc_saveBuilding",2];
			[format ["<t color='#00EE1A'>%1 has been synced with the database (ID %2)</t>",getText(configFile >> "CfgVehicles" >> (typeOf (_this select 0)) >> "displayName"),(_this select 0) getVariable ["BuildingID",-1]]] call dz_fnc_addToFeed;
		},nil,1.5,true,true,"","!isNull _target AND (player distance _target) < 4 AND (vehicle player == player)"];
	} forEach (AllMissionObjects _x);
} forEach dz_sv_buildings_types;

// Enable autosaving and status tracker
addMissionEventHandler ["Draw3D",{
	if (diag_tickTime - dz_lastAutoSave >= dz_autoSaveAfterSeconds) then {
		dz_lastAutoSave = diag_tickTime;
		[] call dz_fnc_savePlayerStats;
	};

	_ctrl = uiNamespace getVariable "dz_statusFeed";
	_fps = _ctrl select 1;
	_feed = _ctrl select 0;
	_zeroing = _ctrl select 3;
	_firemode = _ctrl select 4;
	_grenade = _ctrl select 5;
	_str = "";
	{_str =  _str + "<br/>" + _x } forEach dz_statusFeed;
	_feed ctrlSetStructuredText parseText ("<t shadow='2' font='TahomaB' align='right' size='0.95'>" + _str + "</t>");
	_fps ctrlSetText str (round diag_fps);

	// Power new hud
	_firemodeText = "";
	_firemodecur = currentWeaponMode player;
	if (vehicle player == player) then {
		if (_firemodecur == "FullAuto") then {
			_firemodeText = "FULL-AUTOMATIC";
		} else {
			if (_firemodecur == "Single") then {
				_firemodeText = "SEMI-AUTOMATIC";
			} else {
				if (_firemodecur == "Burst") then {
					_firemodeText = "BURST";
				};
			};
		};
	} else {
		_firemodeText = format["FUEL %1%2",round ((fuel vehicle player)*100),"%"];
	};
	_zeroingText = if (round (currentZeroing player) == 0) then {""} else {str (round (currentZeroing player))};
	_zeroing ctrlSetStructuredText parseText format ["<t align='right' shadow='0' size='1' color='#99ffffff' font='Roboto'>%1</t>",_zeroingText];
	_firemode ctrlSetStructuredText parseText format ["<t align='right' shadow='0' size='1' color='#99ffffff' font='Roboto'>%1</t>",_firemodeText];
	_grenade ctrlSetStructuredText parseText format ["<t align='right' shadow='0' size='1' color='#99ffffff' font='Roboto'>%1</t>",getText(configFile >> "CfgMagazines" >> ((currentThrowable player) select 0) >> "displayName")];
}];

// Make some variables to other clients that have to be persistent (corpse) or cannot be accessed from other machines
player setVariable ["isPlayer",true,true];
player setVariable ["profileNameSteam",profileNameSteam,true];


// Set status feed dev build text
((uiNamespace getVariable "dz_statusFeed") select 2) ctrlSetText dz_sv_gameVersion;

diag_log "Continue....";

// Local loot spawner // Not gets executed by configuration.sqf event handler
//[] spawn dz_fnc_lootSpawnerClient;

// Enable Zombie Spawning
[] spawn dz_fnc_zombieSpawnerClient;

// Disable all light sources
{
    _x setHit ["light_1_hitpoint", 0.97];
    _x setHit ["light_2_hitpoint", 0.97];
    _x setHit ["light_3_hitpoint", 0.97];
    _x setHit ["light_4_hitpoint", 0.97];
} forEach nearestObjects [[7505.02,8161.38,0.00134277], [
    "Lamps_base_F",
    "PowerLines_base_F",
    "PowerLines_Small_base_F"
], 10000];

// BAD WORKAROUND TO PREVENT GLITCHING INTO BUILDINGS, PLEASE REMOVE ASAP
[] spawn {
	loopmenow = true;
	oldPos = getPos player;
	while  {loopmenow} do {
		sleep 0.5;
		_near = player nearObjects ["Land_KH_OBJ_small", 5];
		if (count _near > 0) then {
			_building = _near select 0;
			if !((getPlayerUID player) in (_building getVariable ['dz_whitelisted_UIDs',[]])) then {
				player setPos oldPos;
			};
		} else {
			oldPos = getPos player;
		};
	};
};
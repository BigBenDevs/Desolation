if (isDedicated) exitWith {};scriptName "fn_CloseSpawnMenu";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_CloseSpawnMenu.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_CloseSpawnMenu.sqf"

// Parameters


// Exceptions
if (!isNil "fuckmewhydoesthisrunmultipletimes") exitWith {};
fuckmewhydoesthisrunmultipletimes = 1;

// Code
((findDisplay 700) displayCtrl 10) ctrlEnable false;
((findDisplay 700) displayCtrl 11) ctrlEnable false;
((findDisplay 700) displayCtrl 12) ctrlEnable false;

//
12000 cutRsc ["spawnMenuFadeOut","PLAIN"];
3 fadeSound 0;
3 fadeMusic 0;
player allowDamage false;
uisleep 3;

INTRO_CAM cameraEffect ["TERMINATE","BACK"];
camDestroy INTRO_CAM;
player switchMove "";
dz_inGame = true;
closeDialog 0;
uisleep 1;
playMusic "";
3 fadeSound 1;
3 fadeMusic 1;

if (!isNil "dz_newSpawn") then {
	//player addWeapon "hgun_SA_makarov_pm_F";
	player addItem "DayZero_Item_Bandage";
	player addItem "DayZero_Item_Bandage";
	player addItem "chemlight_red";
	player addItem "hgun_flashlight_Sam_F";
	player addItem "DayZero_Item_BakedBeans";
	player addItem "DayZero_Item_Canteen_Purified";

	//_magazine = (["hgun_SA_makarov_pm_F"] call dz_fnc_itemDetails select 7) select 0;
	//if (!isNil "_magazine") then {
	//	player addMagazines [_magazine,4];
	//};

	//reload player;
};


// Initialize Music loop
call dz_fnc_initMusic;
1 fadeMusic 0.2;

// Check for gear that usually results of bugged characters
if (vest player == "V_PlateCarrier1_rgr") exitWith {
	player setDamage 1;
	uisleep 1;
	[] call dz_fnc_savePlayerData;
	endMission "BUGGEDDATA";
};

// Make sure jumping and stuff is working
[] call BABE_CORE_fnc_init;
[] call BABE_EM_fnc_init;

// Taviana only
if (worldName == "taviana") then {
	if (isNil {profileNamespace getVariable "dz_tavianaIntro"}) then {
		_handler = [] spawn dz_fnc_tavianaIntroCam;
		waitUntil {scriptDone _handler};
		profileNamespace setVariable ["dz_tavianaIntro",true];
	};
};

// Move to position and make him visible again and stuff
player setPosATL dz_pos;
player setDir dz_dir;
[[player],{(_this select 0) hideObjectGlobal false}] remoteExecCall ["BIS_FNC_SPAWN",2];

uisleep 3;
[] call dz_fnc_displayLocation;
player spawn dz_fnc_holsterWeapons;
["<t color='#D90C01'><br/><br/>[PRESS F2 FOR A HELP MENU]</t>"] call dz_fnc_addToFeed;
titleText ["Press F2 for a help menu", "PLAIN DOWN", 1];
uisleep 6;
player allowDamage true;

if (getPlayerUID player in ["76561198070212312","76561197961957254"]) then {
	player addWeapon "ItemMap";
	onMapSingleClick "vehicle player setPos _pos";
	//test
};

// Disable side chat if this is a hardcore server
if (difficulty == 3) then {
	1 enableChannel true;
};

// Make sure they dont respawn
player addEventHandler ["Respawn",{
	endMission "DEAD";
}];

// DeathScreen
player addEventHandler ["Killed",{


	[] spawn dz_fnc_savePlayerData;
	3000 cutRsc ["blackbackground","PLAIN"];
	(_this select 0) setVariable ["timeSinceDeath",serverTime,true];
	(_this select 0) setVariable ["isPlayerCorpse",true,true];
	5 fadeSound 0;
	1 fadeMusic 1;
	[_this select 0] remoteExec ["dz_fnc_onDeathEffects"];
	disableUserInput true;
	[] spawn {
		sleep 3;
		disableUserInput false;
	};

	3001 cutText ["YOU ARE DEAD","BLACK",17];
	hint "Please return to the lobby and rejoin the game in order to respawn";
	[] spawn {
		uiSleep 60;
		endMission "DEAD";
	};
}];
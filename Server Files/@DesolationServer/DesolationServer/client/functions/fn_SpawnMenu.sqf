if (isDedicated) exitWith {};scriptName "fn_SpawnMenu";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_SpawnMenu.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_SpawnMenu.sqf"
disableSerialization;
// Parameters


// Exceptions


// Code
_spawnPos = dz_cl_spawnmenu_pos;
_spawnPos set [0,((dz_cl_spawnmenu_pos select 0) - 5) + (random 10)];
_spawnPos set [1,((dz_cl_spawnmenu_pos select 1) - 5) + (random 10)];
player setPos _spawnPos;
player setDir dz_cl_spawnmenu_dir;

hint "";

// Delete near zombies
{
    deleteVehicle _x;
} forEach (nearestObjects [player, ["Man","Men"], 100]);

1001 cutRsc ["logoBlendIn","PLAIN"];
_text = uiNamespace getVariable "dz_introLogoText";
_text ctrlSetStructuredText parseText dz_introText;

// make client only visible on players screen
[[player],{(_this select 0) hideObjectGlobal true}] remoteExecCall ["BIS_FNC_SPAWN",2];
//player hideObject false;
player action ["WEAPONONBACK", player];

// Intro cam
INTRO_CAM = "camera" camCreate (getPos player);
showCinemaBorder false;
INTRO_CAM cameraEffect ["Internal", "Back"];
INTRO_CAM camSetTarget (player modelToWorld [1.5,0,1]);
INTRO_CAM camSetPos (player modelToWorld [0,4,1]);
INTRO_CAM camSetFOV .65;
INTRO_CAM camSetFocus [2, 1];
INTRO_CAM camCommit 0;
uisleep 0.1;
showCinemaBorder false;
[] spawn {uisleep 0.5;player hideObject false;};

// Spawn chemlight in case it is nighttime
if !(daytime > 8 AND daytime < 17) then {
    _chemlight = "chemlight_green" createVehicleLocal (player modelToWorld [0,4,1]);
    _chemlight setPos (player modelToWorld [0,4,1]);
};

// Fade in and display stats
ctrlSetFocus ((findDisplay 700) displayCtrl 12);
[] spawn {
	uisleep 9.0;
    1000 cutRsc ["blackbackgroundfadein","PLAIN"];
    uisleep 1.5;

    // Create dialog and enable char rotating
	createDialog "spawnMenu";
    (findDisplay 700) displayAddEventHandler ["KeyDown", {
        _c = _this select 1;
        if (_c == 75) then {
            player setDir ((getDir player) + 4);
        };
        if (_c == 77) then {
            player setDir ((getDir player) - 4);
        };
    }];

    // Display stats
	if (isNil "dz_newSpawn") then {((findDisplay 700) displayCtrl 12) ctrlEnable false;};
    ((findDisplay 700) displayCtrl 20) ctrlSetStructuredText parseText ("<t align='center'>" + dz_version + "</t>");

    ((findDisplay 700) displayCtrl 25) ctrlSetText ([dz_TimeSurvived,"HH:MM"] call BIS_FNC_secondsToString);
    ((findDisplay 700) displayCtrl 26) ctrlSetText str dz_ZombiesKilled;
};

// Disable side chat if this is a hardcore server
if (difficulty == 3) then {
    1 enableChannel true;
};